create table public.countries (
  id uuid not null default extensions.uuid_generate_v4 (),
  name character varying(100) not null,
  has_strict_env_regulation boolean null default false,
  created_at timestamp with time zone null default now(),
  updated_at timestamp with time zone null default now(),
  constraint countries_pkey primary key (id),
  constraint countries_name_key unique (name)
) TABLESPACE pg_default;
