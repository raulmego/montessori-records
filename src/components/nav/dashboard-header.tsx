"use client"

import { SidebarTrigger } from "@/components/ui/sidebar"
import { Separator } from "@/components/ui/separator"
import { ThemeToggle } from "@/components/theme-toggle"
import { Bell } from "lucide-react"
import { Button } from "@/components/ui/button"
import { usePathname } from "next/navigation"

const titles: Record<string, string> = {
  "/dashboard": "Dashboard",
  "/dashboard/alumnos": "Alumnos",
  "/dashboard/presentaciones": "Presentaciones",
  "/dashboard/voz": "Asistente de voz",
  "/dashboard/guias": "Guías y profesores",
  "/dashboard/curriculum": "Currículo",
  "/dashboard/reportes": "Reportes",
  "/dashboard/configuracion": "Configuración",
}

export function DashboardHeader() {
  const pathname = usePathname()

  const title = Object.entries(titles)
    .sort((a, b) => b[0].length - a[0].length)
    .find(([key]) => pathname === key || pathname.startsWith(key + "/"))?.[1] ?? "Dashboard"

  return (
    <header className="flex h-14 shrink-0 items-center gap-2 border-b border-border/60 bg-background/80 px-4 backdrop-blur-sm">
      <SidebarTrigger className="-ml-1 cursor-pointer" />
      <Separator orientation="vertical" className="mx-2 h-4" />
      <h1 className="font-semibold text-sm">{title}</h1>

      <div className="ml-auto flex items-center gap-1">
        <Button variant="ghost" size="icon" className="relative cursor-pointer" aria-label="Notificaciones">
          <Bell className="h-4 w-4" />
          <span className="absolute right-2 top-2 h-1.5 w-1.5 rounded-full bg-primary" />
        </Button>
        <ThemeToggle />
      </div>
    </header>
  )
}
