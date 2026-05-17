"use client"

import { ChevronDown, LogOut, User } from "lucide-react"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { SidebarMenuButton } from "@/components/ui/sidebar"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { logout } from "@/lib/supabase/actions"
import Link from "next/link"
import { useTransition } from "react"
import { Loader2 } from "lucide-react"

interface UserMenuProps {
  name: string
  role: string
  initials: string
}

export function UserMenu({ name, role, initials }: UserMenuProps) {
  const [isPending, startTransition] = useTransition()

  function handleLogout() {
    startTransition(async () => {
      await logout()
    })
  }

  return (
    <DropdownMenu>
      <DropdownMenuTrigger className="w-full">
        <SidebarMenuButton size="lg" tooltip={name}>
          <div className="flex w-full items-center gap-2">
            <Avatar className="h-8 w-8 rounded-lg shrink-0">
              <AvatarFallback className="rounded-lg bg-primary/10 text-primary text-xs font-semibold">
                {initials}
              </AvatarFallback>
            </Avatar>
            <div className="flex flex-col gap-0.5 leading-none text-left flex-1 min-w-0">
              <span className="font-medium text-sm truncate">{name}</span>
              <span className="text-xs text-muted-foreground">{role}</span>
            </div>
            {isPending
              ? <Loader2 className="h-4 w-4 shrink-0 animate-spin text-muted-foreground" />
              : <ChevronDown className="h-4 w-4 shrink-0 text-muted-foreground" />}
          </div>
        </SidebarMenuButton>
      </DropdownMenuTrigger>
      <DropdownMenuContent side="top" align="start" className="w-56">
        <DropdownMenuItem className="cursor-pointer">
          <User className="mr-2 h-4 w-4" />
          <Link href="/dashboard/configuracion" className="w-full">Mi perfil</Link>
        </DropdownMenuItem>
        <DropdownMenuSeparator />
        <DropdownMenuItem
          className="cursor-pointer text-destructive focus:text-destructive"
          onClick={handleLogout}
          disabled={isPending}
        >
          <LogOut className="mr-2 h-4 w-4" />
          Cerrar sesión
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
