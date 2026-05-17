import { SidebarProvider, SidebarInset } from "@/components/ui/sidebar"
import { AppSidebar } from "@/components/nav/app-sidebar"
import { DashboardHeader } from "@/components/nav/dashboard-header"
import { createClient } from "@/lib/supabase/server"

export default async function DashboardLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  // Perfil del usuario desde la tabla user_profiles
  const { data: profile } = user
    ? await supabase
        .from("user_profiles")
        .select("first_name, last_name, role, school_id")
        .eq("id", user.id)
        .single()
    : { data: null }

  // Escuela del usuario
  const { data: school } = profile?.school_id
    ? await supabase
        .from("schools")
        .select("name")
        .eq("id", profile.school_id)
        .single()
    : { data: null }

  const displayName = profile
    ? `${profile.first_name} ${profile.last_name}`
    : user?.email?.split("@")[0] ?? "Usuario"

  const initials = profile
    ? `${profile.first_name[0]}${profile.last_name[0]}`.toUpperCase()
    : displayName.slice(0, 2).toUpperCase()

  const roleLabels: Record<string, string> = {
    super_admin: "Super Admin",
    director: "Director",
    coordinator: "Coordinador",
    guide: "Guía",
    co_guide: "Co-Guía",
    alternate: "Profesor Alterno",
    parent: "Padre/Tutor",
  }

  const sidebarUser = {
    name: displayName,
    role: roleLabels[profile?.role ?? ""] ?? "Usuario",
    initials,
    school: school?.name ?? "Montessori Records",
  }

  return (
    <SidebarProvider>
      <AppSidebar user={sidebarUser} />
      <SidebarInset className="flex flex-col min-h-screen overflow-hidden">
        <DashboardHeader />
        <main className="flex-1 overflow-auto p-4 sm:p-6">
          {children}
        </main>
      </SidebarInset>
    </SidebarProvider>
  )
}
