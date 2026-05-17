"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import {
  BookOpen,
  LayoutDashboard,
  Users,
  GraduationCap,
  ClipboardList,
  BarChart3,
  Settings,
  LogOut,
  ChevronDown,
  Mic,
} from "lucide-react"
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarSeparator,
} from "@/components/ui/sidebar"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"

const navMain = [
  { title: "Dashboard",            href: "/dashboard",                icon: LayoutDashboard },
  { title: "Alumnos",              href: "/dashboard/alumnos",        icon: Users },
  { title: "Presentaciones",       href: "/dashboard/presentaciones", icon: ClipboardList },
  { title: "Asistente de voz",     href: "/dashboard/voz",            icon: Mic, badge: "Beta" },
]

const navGestion = [
  { title: "Guías y profesores",   href: "/dashboard/guias",          icon: GraduationCap },
  { title: "Currículo",            href: "/dashboard/curriculum",     icon: BookOpen },
  { title: "Reportes",             href: "/dashboard/reportes",       icon: BarChart3 },
]

const navConfig = [
  { title: "Configuración",        href: "/dashboard/configuracion",  icon: Settings },
]

const mockUser = { name: "Ana García", role: "Guía", school: "Colegio Montessori", initials: "AG" }

function NavItem({ item, pathname }: { item: typeof navMain[0] & { badge?: string }, pathname: string }) {
  const active = pathname === item.href || pathname.startsWith(item.href + "/")
  return (
    <SidebarMenuItem>
      <SidebarMenuButton isActive={active} tooltip={item.title}>
        <Link href={item.href} className="flex w-full items-center gap-2 cursor-pointer">
          <item.icon className="h-4 w-4 shrink-0" />
          <span>{item.title}</span>
          {item.badge && (
            <span className="ml-auto rounded-full bg-primary/10 px-1.5 py-0.5 text-[10px] font-medium text-primary">
              {item.badge}
            </span>
          )}
        </Link>
      </SidebarMenuButton>
    </SidebarMenuItem>
  )
}

export function AppSidebar() {
  const pathname = usePathname()

  return (
    <Sidebar collapsible="icon" variant="sidebar">
      {/* Header */}
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton size="lg" tooltip="Montessori Records">
              <Link href="/dashboard" className="flex w-full items-center gap-2 cursor-pointer">
                <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary text-primary-foreground">
                  <BookOpen className="h-4 w-4" />
                </div>
                <div className="flex flex-col gap-0.5 leading-none">
                  <span className="font-semibold text-sm tracking-tight">Montessori Records</span>
                  <span className="text-xs text-muted-foreground truncate">{mockUser.school}</span>
                </div>
              </Link>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>

      <SidebarSeparator />

      <SidebarContent>
        {/* Navegación principal */}
        <SidebarGroup>
          <SidebarMenu>
            {navMain.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>

        <SidebarSeparator />

        {/* Gestión */}
        <SidebarGroup>
          <SidebarGroupLabel>Gestión</SidebarGroupLabel>
          <SidebarMenu>
            {navGestion.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>

        <SidebarSeparator />

        {/* Config */}
        <SidebarGroup>
          <SidebarMenu>
            {navConfig.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>
      </SidebarContent>

      {/* Footer — Usuario */}
      <SidebarFooter>
        <SidebarMenu>
          <SidebarMenuItem>
            <DropdownMenu>
              <DropdownMenuTrigger className="w-full">
                <SidebarMenuButton size="lg" tooltip={mockUser.name}>
                  <div className="flex w-full items-center gap-2">
                    <Avatar className="h-8 w-8 rounded-lg shrink-0">
                      <AvatarFallback className="rounded-lg bg-primary/10 text-primary text-xs font-semibold">
                        {mockUser.initials}
                      </AvatarFallback>
                    </Avatar>
                    <div className="flex flex-col gap-0.5 leading-none text-left flex-1 min-w-0">
                      <span className="font-medium text-sm truncate">{mockUser.name}</span>
                      <span className="text-xs text-muted-foreground">{mockUser.role}</span>
                    </div>
                    <ChevronDown className="h-4 w-4 shrink-0 text-muted-foreground" />
                  </div>
                </SidebarMenuButton>
              </DropdownMenuTrigger>
              <DropdownMenuContent side="top" align="start" className="w-56">
                <DropdownMenuItem className="cursor-pointer" onClick={() => {}}>
                  <Link href="/dashboard/configuracion" className="w-full">Mi perfil</Link>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem className="cursor-pointer text-destructive focus:text-destructive">
                  <LogOut className="mr-2 h-4 w-4" />
                  Cerrar sesión
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
    </Sidebar>
  )
}
