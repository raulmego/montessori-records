"use client"

import { useState, useTransition } from "react"
import { Check, RotateCcw, BookOpen, ChevronDown, Loader2, Users, User } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
  Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription,
} from "@/components/ui/dialog"
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { updatePresentationStatus } from "./actions"

type Status = "presentado" | "repetido" | "dominado"

interface PresentationCardProps {
  studentId: string
  presentationId: string
  name: string
  currentStatus: Status | null
  currentSessionType: "individual" | "grupal" | null
  presentedAt: string | null
  dominatedAt: string | null
  schoolYear: string
}

const statusConfig = {
  presentado: {
    label: "Presentado",
    badgeClass: "badge-presentado",
    icon: BookOpen,
    next: "repetido" as Status,
    nextLabel: "Marcar repetido",
  },
  repetido: {
    label: "Repetido",
    badgeClass: "badge-repetido",
    icon: RotateCcw,
    next: "dominado" as Status,
    nextLabel: "Marcar dominado",
  },
  dominado: {
    label: "Dominado",
    badgeClass: "badge-dominado",
    icon: Check,
    next: null,
    nextLabel: null,
  },
}

export function PresentationCard({
  studentId, presentationId, name, currentStatus,
  currentSessionType, presentedAt, dominatedAt, schoolYear,
}: PresentationCardProps) {
  const [open, setOpen] = useState(false)
  const [targetStatus, setTargetStatus] = useState<Status>("presentado")
  const [sessionType, setSessionType] = useState<"individual" | "grupal">("individual")
  const [notes, setNotes] = useState("")
  const [isPending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)

  function openDialog(status: Status) {
    setTargetStatus(status)
    setNotes("")
    setError(null)
    setOpen(true)
  }

  function handleSave() {
    setError(null)
    startTransition(async () => {
      const result = await updatePresentationStatus(
        studentId, presentationId, targetStatus, sessionType, notes, schoolYear
      )
      if (result.error) {
        setError(result.error)
      } else {
        setOpen(false)
      }
    })
  }

  const cfg = currentStatus ? statusConfig[currentStatus] : null

  return (
    <>
      <div className="group flex items-center justify-between rounded-lg border border-border/50 bg-card px-3.5 py-2.5 transition-all hover:border-border hover:shadow-sm">
        <div className="flex items-center gap-3 min-w-0 flex-1">
          {/* Indicador de status */}
          <div className={`h-2 w-2 shrink-0 rounded-full ${
            currentStatus === "dominado" ? "bg-[var(--status-dominado)]" :
            currentStatus === "repetido" ? "bg-[var(--status-repetido)]" :
            currentStatus === "presentado" ? "bg-[var(--status-presentado)]" :
            "bg-muted-foreground/20"
          }`} />

          <span className="text-sm truncate">{name}</span>
        </div>

        <div className="flex items-center gap-2 shrink-0">
          {cfg ? (
            <span className={`${cfg.badgeClass} hidden sm:inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-medium`}>
              {cfg.label}
            </span>
          ) : (
            <span className="hidden sm:inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-medium text-muted-foreground/60 border border-dashed border-border">
              Sin registro
            </span>
          )}

          {/* Botón de acción */}
          {currentStatus === "dominado" ? (
            <div className="flex h-7 w-7 items-center justify-center rounded-full bg-[color-mix(in_oklch,var(--status-dominado)_15%,transparent)]">
              <Check className="h-3.5 w-3.5 text-[var(--status-dominado)]" />
            </div>
          ) : (
            <Button
              variant="ghost"
              size="sm"
              className="h-7 px-2.5 text-xs cursor-pointer opacity-0 group-hover:opacity-100 transition-opacity"
              onClick={() => openDialog(currentStatus ? statusConfig[currentStatus].next! : "presentado")}
            >
              {currentStatus ? statusConfig[currentStatus].nextLabel : "Registrar"}
              <ChevronDown className="ml-1 h-3 w-3" />
            </Button>
          )}
        </div>
      </div>

      {/* Dialog para registrar/actualizar */}
      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle className="text-base leading-snug">{name}</DialogTitle>
            <DialogDescription>
              Registrar como{" "}
              <span className={`${statusConfig[targetStatus].badgeClass} inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium`}>
                {statusConfig[targetStatus].label}
              </span>
            </DialogDescription>
          </DialogHeader>

          <div className="space-y-4 pt-2">
            {/* Tipo de sesión */}
            <div className="space-y-2">
              <Label className="text-sm">Tipo de sesión</Label>
              <div className="grid grid-cols-2 gap-2">
                <button
                  type="button"
                  onClick={() => setSessionType("individual")}
                  className={`flex items-center justify-center gap-2 rounded-lg border p-3 text-sm font-medium transition-all cursor-pointer ${
                    sessionType === "individual"
                      ? "border-primary bg-primary/10 text-primary"
                      : "border-border hover:border-border/80 hover:bg-muted/50"
                  }`}
                >
                  <User className="h-4 w-4" />
                  Individual
                </button>
                <button
                  type="button"
                  onClick={() => setSessionType("grupal")}
                  className={`flex items-center justify-center gap-2 rounded-lg border p-3 text-sm font-medium transition-all cursor-pointer ${
                    sessionType === "grupal"
                      ? "border-primary bg-primary/10 text-primary"
                      : "border-border hover:border-border/80 hover:bg-muted/50"
                  }`}
                >
                  <Users className="h-4 w-4" />
                  Grupal
                </button>
              </div>
            </div>

            {/* Notas */}
            <div className="space-y-2">
              <Label htmlFor="notes" className="text-sm">
                Notas <span className="text-muted-foreground font-normal">(opcional)</span>
              </Label>
              <Input
                id="notes"
                placeholder="Observaciones, materiales usados…"
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                className="h-9"
              />
            </div>

            {/* Cambiar a otro status */}
            {currentStatus && (
              <div className="flex gap-1.5 flex-wrap">
                <span className="text-xs text-muted-foreground self-center">Cambiar a:</span>
                {(["presentado", "repetido", "dominado"] as Status[]).map((s) => (
                  <button
                    key={s}
                    type="button"
                    onClick={() => setTargetStatus(s)}
                    className={`${statusConfig[s].badgeClass} inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium cursor-pointer transition-opacity ${
                      targetStatus === s ? "ring-2 ring-offset-1 ring-current" : "opacity-60 hover:opacity-100"
                    }`}
                  >
                    {statusConfig[s].label}
                  </button>
                ))}
              </div>
            )}

            {error && (
              <p className="text-sm text-destructive">{error}</p>
            )}

            <div className="flex gap-2 pt-1">
              <Button variant="outline" className="flex-1 cursor-pointer" onClick={() => setOpen(false)} disabled={isPending}>
                Cancelar
              </Button>
              <Button className="flex-1 cursor-pointer" onClick={handleSave} disabled={isPending}>
                {isPending ? <><Loader2 className="mr-2 h-4 w-4 animate-spin" />Guardando…</> : "Guardar"}
              </Button>
            </div>
          </div>
        </DialogContent>
      </Dialog>
    </>
  )
}
