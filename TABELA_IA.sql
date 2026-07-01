-- Inserir países
INSERT INTO countries (name, has_strict_env_regulation) VALUES
('Estados Unidos', false),
('China', false),
('Índia', false),
('Brasil', false),
('Alemanha', true),
('Japão', false),
('França', true);

-- Inserir plataformas
INSERT INTO ai_platforms (name, developer) VALUES
('ChatGPT', 'OpenAI'),
('Ernie Bot', 'Baidu'),
('Gemini', 'Google'),
('Claude AI', 'Anthropic'),
('Perplexity AI', 'Perplexity'),
('Modelos Generativos Locais', 'Diversos');

-- Inserir métodos de resfriamento
INSERT INTO cooling_methods (name, water_consumption_level, energy_cost_level) VALUES
('Evaporativo', 'alto', 'baixo'),
('Ar', 'baixo', 'alto'),
('Híbrido', 'medio', 'medio'),
('Líquido Fechado', 'baixo', 'medio');

-- Inserir métricas (usando joins para resolver FKs automaticamente)
INSERT INTO country_ai_metrics (
    country_id, primary_platform_id, primary_cooling_method_id,
    active_users_min, active_users_max, water_consumption_liters_min, water_consumption_liters_max,
    interactions_per_user_min, interactions_per_user_max, operational_cost_usd_min, operational_cost_usd_max,
    key_regions, sustainability_initiatives, notes
) VALUES
-- EUA
(SELECT id FROM countries WHERE name = 'Estados Unidos'),
(SELECT id FROM ai_platforms WHERE name = 'ChatGPT'),
(SELECT id FROM cooling_methods WHERE name = 'Evaporativo'),
180000000, 180000000, 2000000000, NULL, 20, 25, 500000000, NULL,
ARRAY['Califórnia','Texas','Virgínia'], '', 'Resfriamento evaporativo predominante; custo operacional elevado'),

-- China
(SELECT id FROM countries WHERE name = 'China'),
(SELECT id FROM ai_platforms WHERE name = 'Ernie Bot'),
(SELECT id FROM cooling_methods WHERE name = 'Ar'),
300000000, 300000000, 3000000000, NULL, 30, 30, NULL, NULL,
ARRAY['Guangdong','Xangai','Pequim'], 'Data centers na Mongólia Interior', 'Incentivo governamental; migração para resfriamento a ar'),

-- Índia
(SELECT id FROM countries WHERE name = 'Índia'),
(SELECT id FROM ai_platforms WHERE name = 'Gemini'),
NULL,
90000000, 100000000, 1000000000, 1000000000, 10, 15, NULL, NULL,
ARRAY['Mumbai','Bangalore','Hyderabad'], '', 'Crescimento acelerado; preocupação com escassez hídrica'),

-- Brasil
(SELECT id FROM countries WHERE name = 'Brasil'),
(SELECT id FROM ai_platforms WHERE name = 'ChatGPT'),
(SELECT id FROM cooling_methods WHERE name = 'Híbrido'),
60000000, 70000000, 800000000, 900000000, 12, 18, NULL, NULL,
ARRAY['São Paulo','Fortaleza'], 'Reuso de água; sistemas híbridos', 'Expansão em regiões com cabos submarinos'),

-- Alemanha
(SELECT id FROM countries WHERE name = 'Alemanha'),
(SELECT id FROM ai_platforms WHERE name = 'Perplexity AI'),
(SELECT id FROM cooling_methods WHERE name = 'Ar'),
40000000, 50000000, 500000000, 600000000, 15, 15, NULL, NULL,
ARRAY[], 'Regulamentação ambiental rigorosa', 'Custo operacional mais elevado por exigências ecológicas'),

-- Japão
(SELECT id FROM countries WHERE name = 'Japão'),
(SELECT id FROM ai_platforms WHERE name = 'ChatGPT'),
(SELECT id FROM cooling_methods WHERE name = 'Líquido Fechado'),
65000000, 65000000, 700000000, 700000000, NULL, NULL, NULL, NULL,
ARRAY['Tóquio','Osaka'], 'Miniaturização de infraestruturas', 'Resfriamento eficiente; soluções locais integradas'),

-- França
(SELECT id FROM countries WHERE name = 'França'),
(SELECT id FROM ai_platforms WHERE name = 'Modelos Generativos Locais'),
(SELECT id FROM cooling_methods WHERE name = 'Híbrido'),
35000000, 35000000, 400000000, 400000000, NULL, NULL, NULL, NULL,
ARRAY[], 'Energias renováveis; uso em setores públicos/educacionais', 'Incentivo governamental à sustentabilidade');
