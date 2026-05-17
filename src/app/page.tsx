import { ThemeToggle } from "@/components/theme-toggle"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { BookOpen, GraduationCap, LayoutDashboard, Mic, Users } from "lucide-react"

const accents = [
  { label: "Pizarra",   hex: "#5b6f8a" },
  { label: "Esmeralda", hex: "#059669" },
  { label: "Rosa",      hex: "#e11d48" },
  { label: "Ámbar",    hex: "#d97706" },
  { label: "Violeta",  hex: "#7c3aed" },
  { label: "Cielo",    hex: "#0284c7" },
  { label: "Teal",     hex: "#0d9488" },
]

const features = [
  {
    icon: BookOpen,
    title: "Registro de presentaciones",
    description: "Seguimiento de 880+ presentaciones por alumno con status Presentado, Repetido y Dominado.",
  },
  {
    icon: Mic,
    title: "Asistente de voz",
    description: "Registra y actualiza presentaciones por dictado libre o modo guiado con IA.",
  },
  {
    icon: Users,
    title: "Gestión de alumnos",
    description: "Expedientes completos con CURP, alergias, padres, contactos y grupo asignado.",
  },
  {
    icon: LayoutDashboard,
    title: "Dashboard con métricas",
    description: "Avance por área, alumno y grupo. Reportes semanales automáticos.",
  },
  {
    icon: GraduationCap,
    title: "Multi-plano y multi-escuela",
    description: "Taller I, II, Casa de Niños y más. Cada escuela con su currículo y colores.",
  },
]

export default function Home() {
  return (
    <div className="min-h-screen bg-background">
      {/* Nav */}
      <header className="sticky top-0 z-50 border-b border-border/60 bg-background/80 backdrop-blur-sm">
        <div className="mx-auto flex h-14 max-w-7xl items-center justify-between px-4 sm:px-6">
          <div className="flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
              <BookOpen className="h-4 w-4" />
            </div>
            <span className="font-semibold tracking-tight">Montessori Records</span>
          </div>
          <div className="flex items-center gap-2">
            <ThemeToggle />
            <Button size="sm" className="cursor-pointer">Ingresar</Button>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-7xl px-4 py-16 sm:px-6">
        {/* Hero */}
        <section className="mb-20 text-center">
          <Badge variant="secondary" className="mb-4">Sistema de gestión Montessori</Badge>
          <h1 className="mb-4 text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
            Registro de presentaciones{" "}
            <span className="text-primary">inteligente</span>
          </h1>
          <p className="mx-auto mb-8 max-w-2xl text-lg text-muted-foreground">
            Lleva el seguimiento completo de cada alumno, desde Comunidad Infantil hasta Taller III,
            con asistente de voz y reportes automáticos.
          </p>
          <div className="flex flex-wrap justify-center gap-3">
            <Button size="lg" className="cursor-pointer">Comenzar ahora</Button>
            <Button size="lg" variant="outline" className="cursor-pointer">Ver demo</Button>
          </div>
        </section>

        {/* Status badges */}
        <section className="mb-20">
          <h2 className="mb-6 text-center text-xs font-semibold uppercase tracking-widest text-muted-foreground">
            Estados de presentación
          </h2>
          <div className="flex flex-wrap justify-center gap-3">
            <span className="badge-presentado inline-flex items-center rounded-full px-4 py-1.5 text-sm font-medium">
              Presentado
            </span>
            <span className="badge-repetido inline-flex items-center rounded-full px-4 py-1.5 text-sm font-medium">
              Repetido
            </span>
            <span className="badge-dominado inline-flex items-center rounded-full px-4 py-1.5 text-sm font-medium">
              Dominado
            </span>
          </div>
        </section>

        {/* Features */}
        <section className="mb-20">
          <h2 className="mb-10 text-center text-2xl font-bold tracking-tight">
            Todo lo que necesita una guía Montessori
          </h2>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {features.map((f) => (
              <Card
                key={f.title}
                className="group cursor-pointer border-border/60 transition-all duration-200 hover:border-primary/40 hover:shadow-md"
              >
                <CardHeader className="pb-3">
                  <div className="mb-2 flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 text-primary transition-colors group-hover:bg-primary/20">
                    <f.icon className="h-5 w-5" />
                  </div>
                  <CardTitle className="text-base">{f.title}</CardTitle>
                </CardHeader>
                <CardContent>
                  <CardDescription className="text-sm leading-relaxed">
                    {f.description}
                  </CardDescription>
                </CardContent>
              </Card>
            ))}
          </div>
        </section>

        {/* Color picker preview */}
        <section className="mb-20">
          <Card className="border-border/60 p-6 sm:p-8">
            <div className="mb-6 text-center">
              <h2 className="mb-2 text-xl font-bold">Color institucional adaptable</h2>
              <p className="text-sm text-muted-foreground">
                Cada escuela puede personalizar el color primario del sistema.
              </p>
            </div>
            <div className="flex flex-wrap justify-center gap-4">
              {accents.map((a) => (
                <div key={a.label} className="flex flex-col items-center gap-1.5">
                  <div
                    className="h-9 w-9 rounded-full border-2 border-white/80 shadow cursor-pointer ring-2 ring-transparent ring-offset-2 ring-offset-background transition-transform hover:scale-110"
                    style={{ backgroundColor: a.hex }}
                    title={a.label}
                  />
                  <span className="text-xs text-muted-foreground">{a.label}</span>
                </div>
              ))}
            </div>
          </Card>
        </section>
      </main>

      <footer className="border-t border-border/60 py-8">
        <div className="mx-auto max-w-7xl px-4 text-center text-sm text-muted-foreground sm:px-6">
          © 2025 Montessori Records · Sistema educativo multi-escuela
        </div>
      </footer>
    </div>
  )
}
