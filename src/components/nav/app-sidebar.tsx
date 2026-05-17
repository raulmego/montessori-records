"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import {
  BookOpen, LayoutDashboard, Users, GraduationCap,
  ClipboardList, BarChart3, Settings, Mic,
} from "lucide-react"
import {
  Sidebar, SidebarContent, SidebarFooter, SidebarGroup,
  SidebarGroupLabel, SidebarHeader, SidebarMenu,
  SidebarMenuButton, SidebarMenuItem, SidebarSeparator,
} from "@/components/ui/sidebar"
import { UserMenu } from "@/components/nav/user-menu"

const navMain = [
  { title: "Dashboard",        href: "/dashboard",                icon: LayoutDashboard },
  { title: "Alumnos",          href: "/dashboard/alumnos",        icon: Users },
  { title: "Presentaciones",   href: "/dashboard/presentaciones", icon: ClipboardList },
  { title: "Asistente de voz", href: "/dashboard/voz",            icon: Mic, badge: "Beta" },
]

const navGestion = [
  { title: "Guías y profesores", href: "/dashboard/guias",       icon: GraduationCap },
  { title: "Currículo",          href: "/dashboard/curriculum",  icon: BookOpen },
  { title: "Reportes",           href: "/dashboard/reportes",    icon: BarChart3 },
]

const navConfig = [
  { title: "Configuración", href: "/dashboard/configuracion", icon: Settings },
]

interface AppSidebarProps {
  user: { name: string; role: string; initials: string; school: string }
}

function NavItem({
  item,
  pathname,
}: {
  item: { title: string; href: string; icon: React.ElementType; badge?: string }
  pathname: string
}) {
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

export function AppSidebar({ user }: AppSidebarProps) {
  const pathname = usePathname()

  return (
    <Sidebar collapsible="icon" variant="sidebar">
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
                  <span className="text-xs text-muted-foreground truncate">{user.school}</span>
                </div>
              </Link>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>

      <SidebarSeparator />

      <SidebarContent>
        <SidebarGroup>
          <SidebarMenu>
            {navMain.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>

        <SidebarSeparator />

        <SidebarGroup>
          <SidebarGroupLabel>Gestión</SidebarGroupLabel>
          <SidebarMenu>
            {navGestion.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>

        <SidebarSeparator />

        <SidebarGroup>
          <SidebarMenu>
            {navConfig.map((item) => <NavItem key={item.href} item={item} pathname={pathname} />)}
          </SidebarMenu>
        </SidebarGroup>
      </SidebarContent>

      <SidebarFooter>
        <SidebarMenu>
          <SidebarMenuItem>
            <UserMenu name={user.name} role={user.role} initials={user.initials} />
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
    </Sidebar>
  )
}
