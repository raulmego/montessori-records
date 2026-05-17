"use server"

import { revalidatePath } from "next/cache"
import { createClient } from "@/lib/supabase/server"
import { createAdminClient } from "@/lib/supabase/admin"

export async function updatePresentationStatus(
  studentId: string,
  presentationId: string,
  status: "presentado" | "repetido" | "dominado",
  sessionType: "individual" | "grupal",
  notes: string,
  schoolYear: string
) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: "No autenticado" }

  // Busca si ya existe un record para este alumno+presentación+ciclo
  const { data: existing } = await supabase
    .from("presentation_records")
    .select("id, status")
    .eq("student_id", studentId)
    .eq("presentation_id", presentationId)
    .eq("school_year", schoolYear)
    .single()

  const now = new Date().toISOString().split("T")[0]

  if (existing) {
    // Actualiza el status
    const { error } = await supabase
      .from("presentation_records")
      .update({
        status,
        session_type: sessionType,
        notes: notes || null,
        presented_at: existing.status === "presentado" ? undefined : status === "presentado" ? now : undefined,
        dominated_at: status === "dominado" ? now : undefined,
        guide_id: user.id,
      })
      .eq("id", existing.id)

    if (error) return { error: error.message }

    // Agrega al historial
    await supabase.from("record_history").insert({
      record_id: existing.id,
      status,
      session_type: sessionType,
      date: now,
      guide_id: user.id,
      notes: notes || null,
    })
  } else {
    // Crea el record nuevo
    const { data: newRecord, error } = await supabase
      .from("presentation_records")
      .insert({
        student_id: studentId,
        presentation_id: presentationId,
        school_year: schoolYear,
        status,
        session_type: sessionType,
        notes: notes || null,
        presented_at: status === "presentado" ? now : null,
        dominated_at: status === "dominado" ? now : null,
        guide_id: user.id,
      })
      .select("id")
      .single()

    if (error) return { error: error.message }

    // Agrega al historial
    if (newRecord) {
      await supabase.from("record_history").insert({
        record_id: newRecord.id,
        status,
        session_type: sessionType,
        date: now,
        guide_id: user.id,
        notes: notes || null,
      })
    }
  }

  revalidatePath(`/dashboard/alumnos/${studentId}/presentaciones`)
  revalidatePath(`/dashboard/alumnos/${studentId}`)
  return { success: true }
}
