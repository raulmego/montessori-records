-- ============================================================
-- MONTESSORI RECORDS — Schema inicial
-- Multi-tenant: cada escuela es un tenant independiente
-- ============================================================

-- Extensiones
create extension if not exists "uuid-ossp";
create extension if not exists "pg_trgm"; -- búsqueda de texto

-- ============================================================
-- TENANTS / ESCUELAS
-- ============================================================

create table schools (
  id          uuid primary key default uuid_generate_v4(),
  name        text not null,
  slug        text not null unique,
  logo_url    text,
  address     text,
  phone       text,
  email       text,
  active      boolean not null default true,
  settings    jsonb not null default '{}',
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- ============================================================
-- PLANOS DE DESARROLLO
-- ============================================================

create table development_planes (
  id          uuid primary key default uuid_generate_v4(),
  name        text not null,
  slug        text not null unique,
  age_min     int not null,
  age_max     int not null,
  description text,
  sort_order  int not null default 0
);

insert into development_planes (name, slug, age_min, age_max, description, sort_order) values
  ('Comunidad Infantil', 'comunidad-infantil', 0, 3, 'Desarrollo de independencia física, movimiento y lenguaje. Incluye Nido (0-18 meses) y Comunidad Infantil (18m-3a).', 1),
  ('Casa de Niños', 'casa-de-ninos', 3, 6, 'Mente absorbente. Áreas: vida práctica, sensorial, matemáticas, lenguaje y cultura.', 2),
  ('Taller I', 'taller-i', 6, 9, 'Transición al pensamiento abstracto. Educación Cósmica, grandes historias.', 3),
  ('Taller II', 'taller-ii', 9, 12, 'Pensamiento crítico, investigación, colaboración y moralidad.', 4),
  ('Taller III / Comunidad de Adolescentes', 'taller-iii', 12, 18, 'Valor en la sociedad, ciencias humanas, emprendimiento.', 5);

-- ============================================================
-- NIVELES / GRUPOS (grados escolares ligados a planos)
-- ============================================================

create table grade_levels (
  id               uuid primary key default uuid_generate_v4(),
  school_id        uuid not null references schools(id) on delete cascade,
  plane_id         uuid not null references development_planes(id),
  name             text not null,       -- ej: "Taller I - Grupo A"
  taller           text,                -- "I", "II", "III"
  grade_number     int,                 -- 1, 2, 3 (dentro del taller)
  group_label      text,                -- "A", "B", "C"
  school_year      text not null,       -- "2024-2025"
  active           boolean not null default true,
  created_at       timestamptz not null default now()
);

-- ============================================================
-- ÁREAS DEL CURRÍCULO
-- ============================================================

create table curriculum_areas (
  id          uuid primary key default uuid_generate_v4(),
  plane_id    uuid not null references development_planes(id),
  school_id   uuid references schools(id) on delete cascade, -- null = global
  name        text not null,
  color       text not null default '#6366f1',
  icon        text,
  sort_order  int not null default 0,
  is_custom   boolean not null default false,
  active      boolean not null default true,
  created_at  timestamptz not null default now()
);

-- ============================================================
-- CATEGORÍAS (subniveles dentro de un área)
-- ============================================================

create table curriculum_categories (
  id          uuid primary key default uuid_generate_v4(),
  area_id     uuid not null references curriculum_areas(id) on delete cascade,
  name        text not null,
  sort_order  int not null default 0,
  active      boolean not null default true
);

-- ============================================================
-- PRESENTACIONES
-- ============================================================

create table presentations (
  id            uuid primary key default uuid_generate_v4(),
  category_id   uuid not null references curriculum_categories(id) on delete cascade,
  name          text not null,
  description   text,
  level         text not null default 'both' check (level in ('taller_i', 'taller_ii', 'both', 'all')),
  sort_order    int not null default 0,
  is_custom     boolean not null default false,
  school_id     uuid references schools(id) on delete cascade, -- null = global
  active        boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

-- ============================================================
-- USUARIOS Y ROLES
-- ============================================================

create table user_profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  school_id   uuid references schools(id) on delete cascade,
  role        text not null default 'guide' check (role in ('super_admin','director','coordinator','guide','co_guide','alternate','parent')),
  first_name  text not null,
  last_name   text not null,
  phone       text,
  photo_url   text,
  specialty   text check (specialty in ('guide','co_guide','music','art','english','pe','other')),
  active      boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- ============================================================
-- ASIGNACIÓN DE GUÍAS A GRUPOS
-- ============================================================

create table grade_guides (
  id            uuid primary key default uuid_generate_v4(),
  grade_id      uuid not null references grade_levels(id) on delete cascade,
  guide_id      uuid not null references user_profiles(id) on delete cascade,
  role          text not null check (role in ('guide','co_guide','alternate')),
  specialty     text,
  created_at    timestamptz not null default now(),
  unique(grade_id, guide_id)
);

-- ============================================================
-- ALUMNOS
-- ============================================================

create table students (
  id            uuid primary key default uuid_generate_v4(),
  school_id     uuid not null references schools(id) on delete cascade,
  first_name    text not null,
  last_name     text not null,
  birth_date    date not null,
  curp          text,
  gender        text check (gender in ('M','F','otro')),
  photo_url     text,
  blood_type    text,
  allergies     text[],
  medical_notes text,
  address       text,
  active        boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

-- Edad calculada automáticamente
create or replace function student_age(birth_date date)
returns int language sql immutable as $$
  select date_part('year', age(current_date, birth_date))::int;
$$;

-- ============================================================
-- INSCRIPCIONES (alumno ↔ grupo ↔ ciclo escolar)
-- ============================================================

create table enrollments (
  id              uuid primary key default uuid_generate_v4(),
  student_id      uuid not null references students(id) on delete cascade,
  grade_id        uuid not null references grade_levels(id),
  school_year     text not null,
  enrolled_at     date not null default current_date,
  active          boolean not null default true,
  created_at      timestamptz not null default now()
);

-- ============================================================
-- PADRES / TUTORES / CONTACTOS
-- ============================================================

create table contacts (
  id            uuid primary key default uuid_generate_v4(),
  student_id    uuid not null references students(id) on delete cascade,
  relationship  text not null check (relationship in ('padre','madre','tutor','abuelo','otro')),
  first_name    text not null,
  last_name     text not null,
  email         text,
  phone         text,
  phone_alt     text,
  is_primary    boolean not null default false,
  can_pickup    boolean not null default true,
  receive_reports boolean not null default false,
  created_at    timestamptz not null default now()
);

-- ============================================================
-- REGISTRO DE PRESENTACIONES (el corazón del sistema)
-- ============================================================

create table presentation_records (
  id               uuid primary key default uuid_generate_v4(),
  student_id       uuid not null references students(id) on delete cascade,
  presentation_id  uuid not null references presentations(id),
  school_year      text not null,
  -- Status actual
  status           text not null check (status in ('presentado','repetido','dominado')),
  -- Tipo de sesión
  session_type     text not null default 'individual' check (session_type in ('individual','grupal')),
  -- Fechas clave
  presented_at     date,
  dominated_at     date,
  -- Guía que dio la presentación
  guide_id         uuid references user_profiles(id),
  -- Resumen/notas generales
  notes            text,
  -- Entrada por voz (transcript)
  voice_transcript text,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),
  unique(student_id, presentation_id, school_year)
);

-- ============================================================
-- HISTORIAL DE CAMBIOS DE STATUS (repeticiones múltiples)
-- ============================================================

create table record_history (
  id               uuid primary key default uuid_generate_v4(),
  record_id        uuid not null references presentation_records(id) on delete cascade,
  status           text not null check (status in ('presentado','repetido','dominado')),
  session_type     text not null default 'individual' check (session_type in ('individual','grupal')),
  date             date not null default current_date,
  guide_id         uuid references user_profiles(id),
  notes            text,
  voice_transcript text,
  created_at       timestamptz not null default now()
);

-- ============================================================
-- REPORTES SEMANALES (caché de reportes generados)
-- ============================================================

create table weekly_reports (
  id            uuid primary key default uuid_generate_v4(),
  school_id     uuid not null references schools(id) on delete cascade,
  grade_id      uuid references grade_levels(id),
  student_id    uuid references students(id),
  week_start    date not null,
  week_end      date not null,
  report_data   jsonb not null default '{}',
  pdf_url       text,
  sent_at       timestamptz,
  sent_to       text[],
  created_at    timestamptz not null default now()
);

-- ============================================================
-- ÍNDICES
-- ============================================================

create index idx_students_school on students(school_id);
create index idx_enrollments_student on enrollments(student_id);
create index idx_enrollments_grade on enrollments(grade_id);
create index idx_presentation_records_student on presentation_records(student_id);
create index idx_presentation_records_status on presentation_records(status);
create index idx_record_history_record on record_history(record_id);
create index idx_record_history_date on record_history(date);
create index idx_presentations_category on presentations(category_id);
create index idx_curriculum_areas_plane on curriculum_areas(plane_id);

-- Búsqueda de texto en presentaciones
create index idx_presentations_name_trgm on presentations using gin(name gin_trgm_ops);
create index idx_students_name_trgm on students using gin((first_name || ' ' || last_name) gin_trgm_ops);

-- ============================================================
-- ROW LEVEL SECURITY (multi-tenant)
-- ============================================================

alter table schools enable row level security;
alter table grade_levels enable row level security;
alter table curriculum_areas enable row level security;
alter table curriculum_categories enable row level security;
alter table presentations enable row level security;
alter table user_profiles enable row level security;
alter table grade_guides enable row level security;
alter table students enable row level security;
alter table enrollments enable row level security;
alter table contacts enable row level security;
alter table presentation_records enable row level security;
alter table record_history enable row level security;
alter table weekly_reports enable row level security;

-- Política base: cada usuario solo ve datos de su escuela
create policy "users see own school" on schools
  for all using (
    id = (select school_id from user_profiles where id = auth.uid())
    or (select role from user_profiles where id = auth.uid()) = 'super_admin'
  );

create policy "school isolation students" on students
  for all using (
    school_id = (select school_id from user_profiles where id = auth.uid())
  );

create policy "school isolation records" on presentation_records
  for all using (
    student_id in (
      select id from students
      where school_id = (select school_id from user_profiles where id = auth.uid())
    )
  );

create policy "global and school presentations" on presentations
  for select using (
    school_id is null
    or school_id = (select school_id from user_profiles where id = auth.uid())
  );

create policy "school manage presentations" on presentations
  for insert with check (
    school_id = (select school_id from user_profiles where id = auth.uid())
  );

-- ============================================================
-- TRIGGERS: updated_at automático
-- ============================================================

create or replace function update_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger trg_schools_updated_at before update on schools
  for each row execute function update_updated_at();
create trigger trg_students_updated_at before update on students
  for each row execute function update_updated_at();
create trigger trg_presentations_updated_at before update on presentations
  for each row execute function update_updated_at();
create trigger trg_records_updated_at before update on presentation_records
  for each row execute function update_updated_at();
create trigger trg_profiles_updated_at before update on user_profiles
  for each row execute function update_updated_at();
