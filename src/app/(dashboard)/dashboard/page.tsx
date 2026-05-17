import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
  Users,
  BookOpen,
  TrendingUp,
  Award,
  ChevronRight,
  Clock,
  BarChart3,
} from "lucide-react"

// Datos mock — se conectan a Supabase en siguiente iteración
const kpis = [
  {
    title: "Alumnos activos",
    value: "24",
    change: "+2 este ciclo",
    icon: Users,
    color: "text-sky-500",
    bg: "bg-sky-500/10",
  },
  {
    title: "Presentaciones esta semana",
    value: "87",
    change: "+12% vs semana pasada",
    icon: BookOpen,
    color: "text-primary",
    bg: "bg-primary/10",
  },
  {
    title: "Tasa de dominio",
    value: "34%",
    change: "Del total de presentaciones",
    icon: Award,
    color: "text-[var(--status-dominado)]",
    bg: "bg-[color-mix(in_oklch,var(--status-dominado)_10%,transparent)]",
  },
  {
    title: "Avance promedio",
    value: "62%",
    change: "Del currículo de Taller I",
    icon: TrendingUp,
    color: "text-[var(--status-repetido)]",
    bg: "bg-[color-mix(in_oklch,var(--status-repetido)_10%,transparent)]",
  },
]

const recentActivity = [
  { alumno: "Sofía Ramírez",  presentacion: "Análisis lógico — Oraciones simples", status: "dominado",   tiempo: "Hace 10 min" },
  { alumno: "Mateo López",    presentacion: "Raíz cuadrada — Concepto y notación",  status: "presentado", tiempo: "Hace 25 min" },
  { alumno: "Valentina Cruz", presentacion: "Teorema de Pitágoras",                 status: "repetido",   tiempo: "Hace 1 hora" },
  { alumno: "Diego Herrera",  presentacion: "Clasificación científica — Reino Vegetal", status: "presentado", tiempo: "Hace 2 horas" },
  { alumno: "Lucía Morales",  presentacion: "Historia de la llegada del hombre",    status: "dominado",   tiempo: "Hace 3 horas" },
]

const areaProgress = [
  { area: "Lenguaje",     presentadas: 142, total: 189, color: "#6366f1" },
  { area: "Matemáticas",  presentadas: 98,  total: 242, color: "#10b981" },
  { area: "Historia",     presentadas: 61,  total: 74,  color: "#f59e0b" },
  { area: "Geometría",    presentadas: 80,  total: 125, color: "#3b82f6" },
  { area: "Biología",     presentadas: 55,  total: 91,  color: "#22c55e" },
  { area: "Geografía",    presentadas: 102, total: 159, color: "#f97316" },
]

const upcomingReports = [
  { title: "Reporte semanal Taller I-A", fecha: "Lun 19 mayo", estado: "programado" },
  { title: "Reporte individual — Sofía R.", fecha: "Mar 20 mayo", estado: "pendiente" },
  { title: "Reporte mensual por área", fecha: "Vie 23 mayo", estado: "programado" },
]

export default function DashboardPage() {
  return (
    <div className="space-y-6 animate-in">
      {/* Saludo */}
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Buenos días, Ana</h2>
          <p className="text-muted-foreground text-sm mt-0.5">
            Taller I — Grupo A · Ciclo 2024–2025
          </p>
        </div>
        <Button className="cursor-pointer hidden sm:flex" size="sm">
          <BookOpen className="mr-2 h-4 w-4" />
          Nueva presentación
        </Button>
      </div>

      {/* KPIs */}
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        {kpis.map((kpi) => (
          <Card key={kpi.title} className="border-border/60">
            <CardContent className="p-5">
              <div className="flex items-center justify-between mb-3">
                <p className="text-sm text-muted-foreground font-medium">{kpi.title}</p>
                <div className={`flex h-9 w-9 items-center justify-center rounded-lg ${kpi.bg}`}>
                  <kpi.icon className={`h-4 w-4 ${kpi.color}`} />
                </div>
              </div>
              <p className="text-3xl font-bold tracking-tight">{kpi.value}</p>
              <p className="text-xs text-muted-foreground mt-1">{kpi.change}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {/* Actividad reciente */}
        <Card className="border-border/60 lg:col-span-2">
          <CardHeader className="pb-3">
            <div className="flex items-center justify-between">
              <CardTitle className="text-base">Actividad reciente</CardTitle>
              <Button variant="ghost" size="sm" className="cursor-pointer text-muted-foreground h-8 px-2">
                Ver todo <ChevronRight className="ml-1 h-3 w-3" />
              </Button>
            </div>
            <CardDescription>Últimas presentaciones registradas hoy</CardDescription>
          </CardHeader>
          <CardContent className="space-y-1">
            {recentActivity.map((item, i) => (
              <div
                key={i}
                className="flex items-center gap-3 rounded-lg p-2.5 transition-colors hover:bg-muted/50 cursor-pointer"
              >
                <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-muted text-xs font-semibold text-muted-foreground">
                  {item.alumno.split(" ").map((n) => n[0]).join("").slice(0, 2)}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium truncate">{item.alumno}</p>
                  <p className="text-xs text-muted-foreground truncate">{item.presentacion}</p>
                </div>
                <div className="flex flex-col items-end gap-1 shrink-0">
                  <span className={`badge-${item.status} inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-medium capitalize`}>
                    {item.status}
                  </span>
                  <span className="flex items-center gap-0.5 text-[10px] text-muted-foreground">
                    <Clock className="h-2.5 w-2.5" />
                    {item.tiempo}
                  </span>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>

        {/* Panel derecho */}
        <div className="space-y-6">
          {/* Progreso por área */}
          <Card className="border-border/60">
            <CardHeader className="pb-3">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base">Avance por área</CardTitle>
                <BarChart3 className="h-4 w-4 text-muted-foreground" />
              </div>
              <CardDescription>Promedio del grupo · Taller I-A</CardDescription>
            </CardHeader>
            <CardContent className="space-y-3">
              {areaProgress.map((area) => {
                const pct = Math.round((area.presentadas / area.total) * 100)
                return (
                  <div key={area.area}>
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-xs font-medium">{area.area}</span>
                      <span className="text-xs text-muted-foreground">{pct}%</span>
                    </div>
                    <div className="h-1.5 w-full rounded-full bg-muted overflow-hidden">
                      <div
                        className="h-full rounded-full transition-all duration-500"
                        style={{ width: `${pct}%`, backgroundColor: area.color }}
                      />
                    </div>
                  </div>
                )
              })}
            </CardContent>
          </Card>

          {/* Reportes próximos */}
          <Card className="border-border/60">
            <CardHeader className="pb-3">
              <CardTitle className="text-base">Próximos reportes</CardTitle>
            </CardHeader>
            <CardContent className="space-y-2">
              {upcomingReports.map((r, i) => (
                <div
                  key={i}
                  className="flex items-start gap-3 rounded-lg p-2 hover:bg-muted/50 transition-colors cursor-pointer"
                >
                  <div className="mt-0.5 h-2 w-2 shrink-0 rounded-full bg-primary" />
                  <div className="flex-1 min-w-0">
                    <p className="text-xs font-medium leading-snug">{r.title}</p>
                    <p className="text-[10px] text-muted-foreground mt-0.5">{r.fecha}</p>
                  </div>
                  <Badge variant="secondary" className="text-[10px] shrink-0">
                    {r.estado}
                  </Badge>
                </div>
              ))}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  )
}
