import { notFound } from "next/navigation"
import Link from "next/link"
import { createClient } from "@/lib/supabase/server"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { ArrowLeft, BookOpen, RotateCcw, Check } from "lucide-react"
import { PresentationCard } from "./presentation-card"

const SCHOOL_YEAR = "2024-2025"

const areaColors: Record<string, string> = {
  Lenguaje: "#6366f1", Matemáticas: "#10b981", Historia: "#f59e0b",
  Geometría: "#3b82f6", Biología: "#22c55e", Geografía: "#f97316",
}

interface PageProps {
  params: Promise<{ id: string }>
}

export default async function PresentacionesAlumnoPage({ params }: PageProps) {
  const { id } = await params
  const supabase = await createClient()

  // Datos del alumno
  const { data: alumno } = await supabase
    .from("students")
    .select("id, first_name, last_name, enrollments(grade_levels(taller, plane_id, development_planes(slug)))")
    .eq("id", id)
    .single()

  if (!alumno) notFound()

  // Detecta el plano de desarrollo del alumno para filtrar presentaciones
  const enrollment = alumno.enrollments?.[0]
  const planSlug = (enrollment?.grade_levels as any)?.development_planes?.slug ?? "taller-i"

  // Obtiene todas las áreas y presentaciones del plano del alumno
  const { data: areas } = await supabase
    .from("curriculum_areas")
    .select(`
      id, name, color, sort_order,
      curriculum_categories (
        id, name, sort_order,
        presentations ( id, name, level, sort_order, active )
      )
    `)
    .eq("development_planes.slug", planSlug)
    .is("school_id", null)
    .order("sort_order")

  // Obtiene los registros del alumno en este ciclo
  const { data: records } = await supabase
    .from("presentation_records")
    .select("presentation_id, status, session_type, presented_at, dominated_at")
    .eq("student_id", id)
    .eq("school_year", SCHOOL_YEAR)

  const recordMap = new Map(
    (records ?? []).map((r) => [r.presentation_id, r])
  )

  // Estadísticas globales
  let totalPresentaciones = 0
  let totalRegistradas = 0
  let totalDominadas = 0

  for (const area of areas ?? []) {
    for (const cat of (area.curriculum_categories ?? []) as any[]) {
      for (const p of (cat.presentations ?? []) as any[]) {
        if (!p.active) continue
        totalPresentaciones++
        const rec = recordMap.get(p.id)
        if (rec) {
          totalRegistradas++
          if (rec.status === "dominado") totalDominadas++
        }
      }
    }
  }

  const pctAvance = totalPresentaciones > 0
    ? Math.round((totalRegistradas / totalPresentaciones) * 100) : 0

  return (
    <div className="space-y-6 animate-in">
      {/* Breadcrumb */}
      <div className="flex items-center justify-between gap-4">
        <div className="flex items-center gap-2 min-w-0">
          <Link
            href={`/dashboard/alumnos/${id}`}
            className="inline-flex items-center gap-1.5 h-8 rounded-lg px-2.5 text-sm font-medium text-muted-foreground hover:text-foreground hover:bg-muted transition-colors cursor-pointer -ml-2 shrink-0"
          >
            <ArrowLeft className="h-4 w-4" />
            Expediente
          </Link>
          <span className="text-muted-foreground">/</span>
          <span className="text-sm font-medium truncate">
            {alumno.first_name} {alumno.last_name} — Presentaciones
          </span>
        </div>
      </div>

      {/* Resumen */}
      <div className="grid grid-cols-3 gap-3 sm:grid-cols-3">
        <Card className="border-border/60">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-primary/10">
              <BookOpen className="h-4 w-4 text-primary" />
            </div>
            <div>
              <p className="text-xl font-bold">{totalRegistradas}<span className="text-sm text-muted-foreground font-normal">/{totalPresentaciones}</span></p>
              <p className="text-xs text-muted-foreground">Registradas</p>
            </div>
          </CardContent>
        </Card>
        <Card className="border-border/60">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-[color-mix(in_oklch,var(--status-dominado)_15%,transparent)]">
              <Check className="h-4 w-4 text-[var(--status-dominado)]" />
            </div>
            <div>
              <p className="text-xl font-bold">{totalDominadas}</p>
              <p className="text-xs text-muted-foreground">Dominadas</p>
            </div>
          </CardContent>
        </Card>
        <Card className="border-border/60">
          <CardContent className="p-4 flex items-center gap-3">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-secondary">
              <RotateCcw className="h-4 w-4 text-muted-foreground" />
            </div>
            <div>
              <p className="text-xl font-bold">{pctAvance}%</p>
              <p className="text-xs text-muted-foreground">Avance</p>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Áreas y presentaciones */}
      <div className="space-y-4">
        {(areas ?? []).map((area: any) => {
          const allPresentations = (area.curriculum_categories ?? [])
            .flatMap((c: any) => (c.presentations ?? []).filter((p: any) => p.active))
            .sort((a: any, b: any) => a.sort_order - b.sort_order)

          if (allPresentations.length === 0) return null

          const registradas = allPresentations.filter((p: any) => recordMap.has(p.id)).length
          const dominadas = allPresentations.filter((p: any) => recordMap.get(p.id)?.status === "dominado").length
          const pct = Math.round((registradas / allPresentations.length) * 100)
          const color = areaColors[area.name] ?? area.color ?? "#6366f1"

          return (
            <Card key={area.id} className="border-border/60 overflow-hidden">
              <CardHeader className="pb-2 pt-4 px-4">
                <div className="flex items-center justify-between gap-3">
                  <div className="flex items-center gap-2.5 min-w-0">
                    <div className="h-3 w-3 rounded-full shrink-0" style={{ backgroundColor: color }} />
                    <CardTitle className="text-base">{area.name}</CardTitle>
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    <span className="badge-dominado inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-medium">
                      {dominadas} dominadas
                    </span>
                    <Badge variant="secondary" className="text-[10px]">
                      {registradas}/{allPresentations.length}
                    </Badge>
                  </div>
                </div>
                {/* Barra de progreso del área */}
                <div className="mt-2 h-1.5 w-full rounded-full bg-muted overflow-hidden">
                  <div
                    className="h-full rounded-full transition-all duration-500"
                    style={{ width: `${pct}%`, backgroundColor: color }}
                  />
                </div>
              </CardHeader>
              <CardContent className="px-4 pb-4 pt-1">
                <div className="space-y-1">
                  {allPresentations.map((p: any) => {
                    const rec = recordMap.get(p.id)
                    return (
                      <PresentationCard
                        key={p.id}
                        studentId={id}
                        presentationId={p.id}
                        name={p.name}
                        currentStatus={rec?.status ?? null}
                        currentSessionType={rec?.session_type ?? null}
                        presentedAt={rec?.presented_at ?? null}
                        dominatedAt={rec?.dominated_at ?? null}
                        schoolYear={SCHOOL_YEAR}
                      />
                    )
                  })}
                </div>
              </CardContent>
            </Card>
          )
        })}
      </div>
    </div>
  )
}
