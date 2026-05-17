import { notFound } from "next/navigation"
import Link from "next/link"
import { createClient } from "@/lib/supabase/server"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Separator } from "@/components/ui/separator"
import {
  ArrowLeft, BookOpen, Phone, Mail, AlertTriangle,
  Calendar, User, GraduationCap, TrendingUp, ChevronRight,
} from "lucide-react"

function calcularEdad(fechaNac: string) {
  const hoy = new Date()
  const nac = new Date(fechaNac)
  let edad = hoy.getFullYear() - nac.getFullYear()
  const m = hoy.getMonth() - nac.getMonth()
  if (m < 0 || (m === 0 && hoy.getDate() < nac.getDate())) edad--
  return edad
}

function formatFecha(fecha: string) {
  return new Date(fecha).toLocaleDateString("es-MX", {
    day: "numeric", month: "long", year: "numeric",
  })
}

const areaColors: Record<string, string> = {
  Lenguaje: "#6366f1",
  Matemáticas: "#10b981",
  Historia: "#f59e0b",
  Geometría: "#3b82f6",
  Biología: "#22c55e",
  Geografía: "#f97316",
}

interface PageProps {
  params: Promise<{ id: string }>
}

export default async function AlumnoPage({ params }: PageProps) {
  const { id } = await params
  const supabase = await createClient()

  // Datos del alumno
  const { data: alumno } = await supabase
    .from("students")
    .select(`
      *,
      enrollments (
        school_year, active,
        grade_levels ( name, taller, grade_number, group_label,
          development_planes ( name )
        )
      ),
      contacts ( * )
    `)
    .eq("id", id)
    .single()

  if (!alumno) notFound()

  // Estadísticas de presentaciones del alumno
  const { data: records } = await supabase
    .from("presentation_records")
    .select(`
      status,
      presentations (
        name,
        curriculum_categories (
          curriculum_areas ( name )
        )
      )
    `)
    .eq("student_id", id)

  // Agrupa por área
  const statsByArea: Record<string, { presentado: number; repetido: number; dominado: number; total: number }> = {}
  const statusCount = { presentado: 0, repetido: 0, dominado: 0 }

  for (const r of records ?? []) {
    const area = (r.presentations as any)?.curriculum_categories?.curriculum_areas?.name ?? "Sin área"
    if (!statsByArea[area]) statsByArea[area] = { presentado: 0, repetido: 0, dominado: 0, total: 0 }
    statsByArea[area][r.status as "presentado" | "repetido" | "dominado"]++
    statsByArea[area].total++
    statusCount[r.status as "presentado" | "repetido" | "dominado"]++
  }

  const totalRegistros = (records ?? []).length
  const enrollment = alumno.enrollments?.find((e: any) => e.active)
  const grade = enrollment?.grade_levels
  const contactoPrimario = alumno.contacts?.find((c: any) => c.is_primary) ?? alumno.contacts?.[0]

  return (
    <div className="space-y-6 animate-in">
      {/* Breadcrumb + acciones */}
      <div className="flex items-center justify-between gap-4">
        <div className="flex items-center gap-2">
          <Button variant="ghost" size="sm" className="cursor-pointer -ml-2 h-8">
            <Link href="/dashboard/alumnos">
              <ArrowLeft className="mr-1.5 h-4 w-4" />
              Alumnos
            </Link>
          </Button>
          <span className="text-muted-foreground">/</span>
          <span className="text-sm font-medium truncate max-w-[200px]">
            {alumno.first_name} {alumno.last_name}
          </span>
        </div>
        <div className="flex gap-2 shrink-0">
          <Button variant="outline" size="sm" className="cursor-pointer hidden sm:flex">
            Generar reporte
          </Button>
          <Link
            href={`/dashboard/alumnos/${id}/presentaciones`}
            className="inline-flex items-center gap-1.5 h-7 rounded-[min(var(--radius-md),12px)] px-2.5 text-[0.8rem] font-medium bg-primary text-primary-foreground hover:bg-primary/80 transition-colors cursor-pointer"
          >
            <BookOpen className="h-3.5 w-3.5" />
            Ver presentaciones
          </Link>
        </div>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {/* Columna izquierda — datos */}
        <div className="space-y-4 lg:col-span-1">
          {/* Perfil */}
          <Card className="border-border/60">
            <CardContent className="p-5">
              <div className="flex flex-col items-center text-center gap-3 pb-4">
                <div className="flex h-20 w-20 items-center justify-center rounded-full bg-primary/10 text-primary text-2xl font-bold">
                  {`${alumno.first_name[0]}${alumno.last_name[0]}`.toUpperCase()}
                </div>
                <div>
                  <h2 className="font-bold text-lg leading-tight">
                    {alumno.first_name} {alumno.last_name}
                  </h2>
                  {grade && (
                    <p className="text-sm text-muted-foreground mt-0.5">
                      {grade.taller} · Grupo {grade.group_label}
                    </p>
                  )}
                </div>
                {alumno.allergies?.length > 0 && (
                  <div className="flex items-center gap-1.5 rounded-lg border border-destructive/30 bg-destructive/10 px-3 py-1.5 text-xs text-destructive w-full justify-center">
                    <AlertTriangle className="h-3.5 w-3.5 shrink-0" />
                    <span className="font-medium">Alergia: {alumno.allergies.join(", ")}</span>
                  </div>
                )}
              </div>

              <Separator className="mb-4" />

              <dl className="space-y-3 text-sm">
                <div className="flex items-start gap-3">
                  <Calendar className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                  <div>
                    <dt className="text-xs text-muted-foreground">Fecha de nacimiento</dt>
                    <dd className="font-medium">{formatFecha(alumno.birth_date)}</dd>
                    <dd className="text-xs text-muted-foreground">{calcularEdad(alumno.birth_date)} años</dd>
                  </div>
                </div>

                {alumno.curp && (
                  <div className="flex items-start gap-3">
                    <User className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                    <div>
                      <dt className="text-xs text-muted-foreground">CURP</dt>
                      <dd className="font-mono text-xs font-medium tracking-wide">{alumno.curp}</dd>
                    </div>
                  </div>
                )}

                {alumno.blood_type && (
                  <div className="flex items-start gap-3">
                    <span className="h-4 w-4 flex items-center justify-center text-muted-foreground shrink-0 text-xs">🩸</span>
                    <div>
                      <dt className="text-xs text-muted-foreground">Tipo de sangre</dt>
                      <dd className="font-medium">{alumno.blood_type}</dd>
                    </div>
                  </div>
                )}

                {grade && (
                  <div className="flex items-start gap-3">
                    <GraduationCap className="h-4 w-4 text-muted-foreground mt-0.5 shrink-0" />
                    <div>
                      <dt className="text-xs text-muted-foreground">Grupo</dt>
                      <dd className="font-medium">{grade.name}</dd>
                      <dd className="text-xs text-muted-foreground">Ciclo {enrollment?.school_year}</dd>
                    </div>
                  </div>
                )}

                {alumno.medical_notes && (
                  <div className="rounded-lg bg-amber-500/10 border border-amber-500/20 p-3">
                    <p className="text-xs font-medium text-amber-700 dark:text-amber-400 mb-1">Notas médicas</p>
                    <p className="text-xs text-muted-foreground">{alumno.medical_notes}</p>
                  </div>
                )}
              </dl>
            </CardContent>
          </Card>

          {/* Contactos */}
          {alumno.contacts?.length > 0 && (
            <Card className="border-border/60">
              <CardHeader className="pb-3">
                <CardTitle className="text-sm">Contactos</CardTitle>
              </CardHeader>
              <CardContent className="space-y-3 pt-0">
                {alumno.contacts.map((c: any) => (
                  <div key={c.id} className="flex items-start gap-3">
                    <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-muted text-xs font-semibold">
                      {`${c.first_name[0]}${c.last_name[0]}`.toUpperCase()}
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-1.5">
                        <p className="text-sm font-medium truncate">{c.first_name} {c.last_name}</p>
                        {c.is_primary && <Badge variant="secondary" className="text-[10px] h-4 px-1">Principal</Badge>}
                      </div>
                      <p className="text-xs text-muted-foreground capitalize">{c.relationship}</p>
                      {c.phone && (
                        <a href={`tel:${c.phone}`} className="flex items-center gap-1 text-xs text-muted-foreground hover:text-primary transition-colors mt-0.5 cursor-pointer">
                          <Phone className="h-3 w-3" />{c.phone}
                        </a>
                      )}
                      {c.email && (
                        <a href={`mailto:${c.email}`} className="flex items-center gap-1 text-xs text-muted-foreground hover:text-primary transition-colors cursor-pointer">
                          <Mail className="h-3 w-3" />{c.email}
                        </a>
                      )}
                    </div>
                  </div>
                ))}
              </CardContent>
            </Card>
          )}
        </div>

        {/* Columna derecha — presentaciones */}
        <div className="space-y-4 lg:col-span-2">
          {/* KPIs de presentaciones */}
          <div className="grid grid-cols-3 gap-3">
            {[
              { label: "Presentadas", value: statusCount.presentado, cls: "badge-presentado" },
              { label: "Repetidas",   value: statusCount.repetido,   cls: "badge-repetido" },
              { label: "Dominadas",   value: statusCount.dominado,   cls: "badge-dominado" },
            ].map((s) => (
              <Card key={s.label} className="border-border/60">
                <CardContent className="p-4 text-center">
                  <p className="text-2xl font-bold">{s.value}</p>
                  <span className={`${s.cls} inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium mt-1`}>
                    {s.label}
                  </span>
                </CardContent>
              </Card>
            ))}
          </div>

          {/* Avance por área */}
          <Card className="border-border/60">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base">Avance por área</CardTitle>
                <TrendingUp className="h-4 w-4 text-muted-foreground" />
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              {totalRegistros === 0 ? (
                <p className="text-sm text-muted-foreground text-center py-4">
                  Aún no hay presentaciones registradas
                </p>
              ) : (
                Object.entries(statsByArea).map(([area, stats]) => {
                  const pct = Math.round((stats.dominado / Math.max(stats.total, 1)) * 100)
                  const color = areaColors[area] ?? "#6366f1"
                  return (
                    <div key={area}>
                      <div className="flex items-center justify-between mb-1.5">
                        <div className="flex items-center gap-2">
                          <div className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: color }} />
                          <span className="text-sm font-medium">{area}</span>
                        </div>
                        <div className="flex items-center gap-3 text-xs text-muted-foreground">
                          <span className="badge-presentado px-1.5 py-0.5 rounded text-[10px]">{stats.presentado}</span>
                          <span className="badge-repetido px-1.5 py-0.5 rounded text-[10px]">{stats.repetido}</span>
                          <span className="badge-dominado px-1.5 py-0.5 rounded text-[10px]">{stats.dominado}</span>
                          <span className="font-medium w-8 text-right">{pct}%</span>
                        </div>
                      </div>
                      <div className="h-2 w-full rounded-full bg-muted overflow-hidden">
                        <div className="h-full rounded-full" style={{ width: `${pct}%`, backgroundColor: color }} />
                      </div>
                    </div>
                  )
                })
              )}
            </CardContent>
          </Card>

          {/* CTA ver todas las presentaciones */}
          <Card className="border-border/60 border-dashed cursor-pointer group hover:border-primary/40 transition-colors">
            <Link href={`/dashboard/alumnos/${id}/presentaciones`}>
              <CardContent className="flex items-center justify-between p-5">
                <div className="flex items-center gap-3">
                  <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary group-hover:bg-primary/20 transition-colors">
                    <BookOpen className="h-5 w-5" />
                  </div>
                  <div>
                    <p className="font-medium text-sm">Ver todas las presentaciones</p>
                    <p className="text-xs text-muted-foreground">{totalRegistros} registradas · Filtra por área y status</p>
                  </div>
                </div>
                <ChevronRight className="h-5 w-5 text-muted-foreground group-hover:translate-x-0.5 transition-transform" />
              </CardContent>
            </Link>
          </Card>
        </div>
      </div>
    </div>
  )
}
