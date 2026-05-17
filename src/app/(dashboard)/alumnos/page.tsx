"use client"

import { useState } from "react"
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import {
  Search,
  Plus,
  MoreHorizontal,
  Phone,
  Mail,
  ChevronRight,
  Filter,
  Users,
} from "lucide-react"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

// Mock — se reemplaza con query a Supabase
const alumnos = [
  { id: "1", nombre: "Sofía Ramírez García",       curp: "RAGS140512MDFMRF01", nacimiento: "2014-05-12", taller: "Taller I",  grupo: "A", avance: 78, alergias: ["Polen"], contacto: "555-123-4567" },
  { id: "2", nombre: "Mateo López Hernández",       curp: "LOHM150830HDFPMT02", nacimiento: "2015-08-30", taller: "Taller I",  grupo: "A", avance: 65, alergias: [],         contacto: "555-234-5678" },
  { id: "3", nombre: "Valentina Cruz Morales",      curp: "CUMV140220MDFRVL03", nacimiento: "2014-02-20", taller: "Taller I",  grupo: "A", avance: 82, alergias: ["Nueces"], contacto: "555-345-6789" },
  { id: "4", nombre: "Diego Herrera Sánchez",       curp: "HESD150115HDFRDG04", nacimiento: "2015-01-15", taller: "Taller I",  grupo: "B", avance: 54, alergias: [],         contacto: "555-456-7890" },
  { id: "5", nombre: "Lucía Morales Jiménez",       curp: "MOJL140708MDFRLC05", nacimiento: "2014-07-08", taller: "Taller I",  grupo: "B", avance: 91, alergias: ["Lactosa"], contacto: "555-567-8901" },
  { id: "6", nombre: "Sebastián Torres Reyes",      curp: "TERS150322HDFRSB06", nacimiento: "2015-03-22", taller: "Taller II", grupo: "A", avance: 43, alergias: [],         contacto: "555-678-9012" },
  { id: "7", nombre: "Isabella Vargas Castillo",    curp: "VACI130918MDFRVR07", nacimiento: "2013-09-18", taller: "Taller II", grupo: "A", avance: 70, alergias: ["Gluten"], contacto: "555-789-0123" },
  { id: "8", nombre: "Nicolás Seguí Barbero",       curp: "SEBN140630HDFRCL08", nacimiento: "2014-06-30", taller: "Taller I",  grupo: "A", avance: 67, alergias: [],         contacto: "555-890-1234" },
]

function calcularEdad(nacimiento: string) {
  const hoy = new Date()
  const nac = new Date(nacimiento)
  let edad = hoy.getFullYear() - nac.getFullYear()
  const m = hoy.getMonth() - nac.getMonth()
  if (m < 0 || (m === 0 && hoy.getDate() < nac.getDate())) edad--
  return edad
}

function getAvanceColor(pct: number) {
  if (pct >= 75) return "var(--status-dominado)"
  if (pct >= 50) return "var(--status-repetido)"
  return "var(--status-presentado)"
}

const grupos = ["Todos", "Taller I - A", "Taller I - B", "Taller II - A"]

export default function AlumnosPage() {
  const [search, setSearch] = useState("")
  const [grupoFiltro, setGrupoFiltro] = useState("Todos")

  const filtered = alumnos.filter((a) => {
    const matchSearch = a.nombre.toLowerCase().includes(search.toLowerCase()) ||
      a.curp.toLowerCase().includes(search.toLowerCase())
    const matchGrupo = grupoFiltro === "Todos" || `${a.taller} - ${a.grupo}` === grupoFiltro
    return matchSearch && matchGrupo
  })

  return (
    <div className="space-y-6 animate-in">
      {/* Encabezado */}
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h2 className="text-2xl font-bold tracking-tight">Alumnos</h2>
          <p className="text-muted-foreground text-sm mt-0.5">{alumnos.length} alumnos registrados</p>
        </div>
        <Button className="cursor-pointer w-full sm:w-auto">
          <Plus className="mr-2 h-4 w-4" />
          Nuevo alumno
        </Button>
      </div>

      {/* Filtros */}
      <div className="flex flex-col gap-3 sm:flex-row">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder="Buscar por nombre o CURP…"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="pl-9 h-9"
          />
        </div>
        <div className="flex gap-2">
          {grupos.map((g) => (
            <Button
              key={g}
              variant={grupoFiltro === g ? "default" : "outline"}
              size="sm"
              onClick={() => setGrupoFiltro(g)}
              className="cursor-pointer whitespace-nowrap h-9"
            >
              {g === "Todos" ? <><Filter className="mr-1.5 h-3 w-3" />{g}</> : g}
            </Button>
          ))}
        </div>
      </div>

      {/* Resultados vacíos */}
      {filtered.length === 0 && (
        <Card className="border-border/60 border-dashed">
          <CardContent className="flex flex-col items-center justify-center py-16 text-center">
            <Users className="h-10 w-10 text-muted-foreground/40 mb-3" />
            <p className="font-medium text-muted-foreground">No se encontraron alumnos</p>
            <p className="text-sm text-muted-foreground/60 mt-1">Intenta con otro término de búsqueda</p>
          </CardContent>
        </Card>
      )}

      {/* Grid de alumnos */}
      <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
        {filtered.map((alumno) => {
          const edad = calcularEdad(alumno.nacimiento)
          const avanceColor = getAvanceColor(alumno.avance)

          return (
            <Card
              key={alumno.id}
              className="group border-border/60 cursor-pointer transition-all duration-200 hover:border-primary/30 hover:shadow-md"
            >
              <CardContent className="p-4">
                {/* Header */}
                <div className="flex items-start justify-between mb-3">
                  <div className="flex items-center gap-3">
                    <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary font-semibold text-sm">
                      {alumno.nombre.split(" ").map((n) => n[0]).join("").slice(0, 2).toUpperCase()}
                    </div>
                    <div className="min-w-0">
                      <p className="font-semibold text-sm leading-tight truncate">{alumno.nombre}</p>
                      <p className="text-xs text-muted-foreground mt-0.5">{edad} años · {alumno.taller} {alumno.grupo}</p>
                    </div>
                  </div>
                  <DropdownMenu>
                    <DropdownMenuTrigger>
                      <Button
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 shrink-0 opacity-0 group-hover:opacity-100 cursor-pointer transition-opacity"
                        onClick={(e) => e.stopPropagation()}
                      >
                        <MoreHorizontal className="h-4 w-4" />
                      </Button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent align="end" className="w-44">
                      <DropdownMenuItem className="cursor-pointer">Ver expediente</DropdownMenuItem>
                      <DropdownMenuItem className="cursor-pointer">Ver presentaciones</DropdownMenuItem>
                      <DropdownMenuItem className="cursor-pointer">Generar reporte</DropdownMenuItem>
                      <DropdownMenuSeparator />
                      <DropdownMenuItem className="cursor-pointer">Editar datos</DropdownMenuItem>
                      <DropdownMenuItem className="cursor-pointer text-destructive focus:text-destructive">
                        Dar de baja
                      </DropdownMenuItem>
                    </DropdownMenuContent>
                  </DropdownMenu>
                </div>

                {/* Avance */}
                <div className="mb-3">
                  <div className="flex items-center justify-between mb-1">
                    <span className="text-xs text-muted-foreground">Avance del currículo</span>
                    <span className="text-xs font-semibold" style={{ color: avanceColor }}>
                      {alumno.avance}%
                    </span>
                  </div>
                  <div className="h-1.5 w-full rounded-full bg-muted overflow-hidden">
                    <div
                      className="h-full rounded-full transition-all duration-500"
                      style={{ width: `${alumno.avance}%`, backgroundColor: avanceColor }}
                    />
                  </div>
                </div>

                {/* Info */}
                <div className="flex items-center justify-between">
                  <div className="flex gap-1.5 flex-wrap">
                    <span className="text-[10px] font-mono text-muted-foreground bg-muted px-1.5 py-0.5 rounded">
                      {alumno.curp.slice(0, 10)}…
                    </span>
                    {alumno.alergias.length > 0 && (
                      <Badge variant="destructive" className="text-[10px] px-1.5 py-0.5 h-auto">
                        ⚠ {alumno.alergias.join(", ")}
                      </Badge>
                    )}
                  </div>
                  <ChevronRight className="h-4 w-4 text-muted-foreground shrink-0 transition-transform group-hover:translate-x-0.5" />
                </div>
              </CardContent>
            </Card>
          )
        })}
      </div>
    </div>
  )
}
