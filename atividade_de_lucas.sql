-- Extensão para UUIDs (padrão no Supabase)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Países
CREATE TABLE countries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    has_strict_env_regulation BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Plataformas de IA
CREATE TABLE ai_platforms (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    developer VARCHAR(100),
    is_generative BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Métodos de Resfriamento
CREATE TABLE cooling_methods (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL UNIQUE,
    water_consumption_level VARCHAR(20), -- 'alto', 'medio', 'baixo'
    energy_cost_level VARCHAR(20),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Métricas por País
CREATE TABLE country_ai_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    country_id UUID REFERENCES countries(id) ON DELETE CASCADE,
    primary_platform_id UUID REFERENCES ai_platforms(id) ON DELETE SET NULL,
    primary_cooling_method_id UUID REFERENCES cooling_methods(id) ON DELETE SET NULL,
    
    active_users_min BIGINT,
    active_users_max BIGINT,
    water_consumption_liters_min BIGINT,
    water_consumption_liters_max BIGINT,
    interactions_per_user_min INTEGER,
    interactions_per_user_max INTEGER,
    operational_cost_usd_min NUMERIC(15,2),
    operational_cost_usd_max NUMERIC(15,2),
    
    key_regions TEXT[],
    sustainability_initiatives TEXT,
    notes TEXT,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX idx_metrics_country ON country_ai_metrics(country_id);
CREATE INDEX idx_metrics_platform ON country_ai_metrics(primary_platform_id);
CREATE INDEX idx_metrics_cooling ON country_ai_metrics(primary_cooling_method_id);
