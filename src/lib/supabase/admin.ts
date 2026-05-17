import { createClient } from '@supabase/supabase-js'

// Solo para operaciones del servidor que requieren service_role (bypassa RLS)
export function createAdminClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  )
}
