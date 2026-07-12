-- Spirit Sprint tables, in the shared CNSL Supabase project.
-- Anonymous, link-based collaboration: no auth.users involved.
-- A "session" is identified by a random slug that lives in the URL;
-- knowing the slug is the only access control (like a Miro/Framer share link).

create table if not exists spiritsprint_sessions (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  project_name text not null default 'Euer Projekt',
  created_at timestamptz not null default now(),
  -- personality slider state, e.g. {"playful_serious": -0.6, "rebel_conventional": 0.3, "contemporary_classic": -0.2, "elite_broad": 0.1}
  personality jsonb not null default '{}'::jsonb,
  -- which two axis keys were chosen for positioning, e.g. ["playful_serious","contemporary_classic"]
  positioning_axes jsonb not null default '[]'::jsonb
);

create table if not exists spiritsprint_participants (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references spiritsprint_sessions(id) on delete cascade,
  -- random anonymous display name generated client-side, e.g. "Anonymous Fox"
  display_name text not null,
  color text not null default '#5100ff',
  created_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now()
);

-- Sticky notes for Feelings/Associations and Values boards.
create table if not exists spiritsprint_notes (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references spiritsprint_sessions(id) on delete cascade,
  participant_id uuid references spiritsprint_participants(id) on delete set null,
  -- 'soul_feelings' | 'values_culture' | 'values_technology' | 'values_business' | 'values_planet' | 'values_organisation'
  board text not null,
  text text not null,
  votes int not null default 0,
  is_keeper boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists spiritsprint_votes (
  id uuid primary key default gen_random_uuid(),
  note_id uuid not null references spiritsprint_notes(id) on delete cascade,
  participant_id uuid not null references spiritsprint_participants(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (note_id, participant_id)
);

alter table spiritsprint_sessions enable row level security;
alter table spiritsprint_participants enable row level security;
alter table spiritsprint_notes enable row level security;
alter table spiritsprint_votes enable row level security;

-- Anonymous, link-is-the-secret model: anyone with the anon key can read/write
-- any row (same trust model as an unlisted Miro/Framer link). No per-row owner
-- checks — the slug itself is the access boundary, not enforced in SQL.
create policy "anon full access sessions" on spiritsprint_sessions for all using (true) with check (true);
create policy "anon full access participants" on spiritsprint_participants for all using (true) with check (true);
create policy "anon full access notes" on spiritsprint_notes for all using (true) with check (true);
create policy "anon full access votes" on spiritsprint_votes for all using (true) with check (true);

-- Required for the client's realtime subscriptions (live sync between
-- participants) to receive postgres_changes events on these tables.
alter publication supabase_realtime add table spiritsprint_sessions;
alter publication supabase_realtime add table spiritsprint_notes;
alter publication supabase_realtime add table spiritsprint_votes;

-- RLS policies alone don't grant access — the anon role also needs the base
-- table privileges (this project's default privileges didn't include them).
grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.spiritsprint_sessions to anon, authenticated;
grant select, insert, update, delete on public.spiritsprint_participants to anon, authenticated;
grant select, insert, update, delete on public.spiritsprint_notes to anon, authenticated;
grant select, insert, update, delete on public.spiritsprint_votes to anon, authenticated;
