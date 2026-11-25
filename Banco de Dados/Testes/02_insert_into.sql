-- =====================================================================
-- MAPERE - Banco de dados (PostgreSQL / Supabase)
-- Script 02: INSERT INTO (dados de teste)
--
-- Rodar DEPOIS de Tabelas/01_create_tables.sql.
-- Os 47 postos (nome, endereco, plugue e potencia) sao reais de Aracaju,
-- vindos de listas publicas. Status, idade da informacao, vagas, avaliacoes,
-- usuarios, ofertas e estatisticas sao SIMULADOS. E-mails usam @example.com.
-- =====================================================================

-- 1. Plugues -----------------------------------------------------------
insert into conector_tipo (id, nome) values
  (1, 'CCS2'),
  (2, 'Type 2'),
  (3, 'CHAdeMO'),
  (4, 'GB/T'),
  (5, 'Outro');

-- 2. Modelos de carro --------------------------------------------------
insert into carro_modelo (id, nome, potencia_max_kw) values
  (1, 'BYD Dolphin',                      88),
  (2, 'BYD Dolphin Mini',                 40),
  (3, 'GWM Ora 03',                       80),
  (4, 'Volvo EX30',                      153),
  (5, 'Nissan Leaf',                      50),
  (6, 'BYD Song Plus (hibrido plug-in)',   7),
  (7, 'Outro (plugue GB/T)',              60);

insert into carro_modelo_conector (carro_modelo_id, conector_tipo_id) values
  (1, 1), (1, 2),
  (2, 1), (2, 2),
  (3, 1), (3, 2),
  (4, 1), (4, 2),
  (5, 3), (5, 2),
  (6, 2),
  (7, 4), (7, 2);

-- 3. Usuarios (ficticios) ---------------------------------------------
insert into usuario (id, nome, email, telefone, perfil, nome_estabelecimento, carro_modelo_id, pontos) values
  (1, 'Marcos Oliveira', 'marcos@example.com', '(79) 90000-0001', 'motorista',  null, 1, 95),
  (2, 'Ana Souza',       'ana@example.com',    '(79) 90000-0002', 'motorista',  null, 2, 25),
  (3, 'Carlos Mendes',   'carlos@example.com', '(79) 90000-0003', 'motorista',  null, 5, 210),
  (4, 'Conta demo',      'dono.demo@example.com', '(79) 90000-0004', 'dono_posto', 'Conta demo (dados ficticios)', null, 0);

-- 4. Postos reais de Aracaju (47) --------------------------------------
insert into posto (id, nome, endereco, bairro, latitude, longitude, posicao_aproximada, status, status_atualizado_em, fonte_status, confirmacoes, vagas_total, vagas_livres, potencia_kw, preco_kwh, horario, dono_id) values
  (1, 'Eletroposto Aperipê', 'R. Rafael de Aguiar, 375', 'Pereira Lobo', -10.9268, -37.0711, true, 'livre', now() - interval '4 minutes', 'usuarios', 5, 4, 3, 120, null, 'A confirmar', null),
  (2, 'Audi Center Aracaju (Enel X)', 'Av. Pres. Tancredo Neves, 1254', 'Jardins', -10.9509, -37.0642, true, 'ocupado', now() - interval '9 minutes', 'operadora', 3, 2, 0, 150, null, 'A confirmar', null),
  (3, 'Hiper Volt', 'R. Espírito Santo, 672', 'Siqueira Campos', -10.924, -37.062, true, 'livre', now() - interval '19 minutes', 'usuarios', 2, 2, 1, 80, null, 'A confirmar', null),
  (4, 'BR Super Carga – Marcondes Ferraz', 'R. Marcondes Ferraz, 210', 'Jardins', -10.9535, -37.0543, true, 'livre', now() - interval '6 minutes', 'operadora', 4, 2, 2, 60, null, 'A confirmar', null),
  (5, 'BR Super Carga – RioMar Shopping', 'Av. Delmiro Gouveia, 400', 'Coroa do Meio', -10.9454, -37.0478, false, 'ocupado', now() - interval '3 minutes', 'usuarios', 6, 2, 0, 60, null, 'Horário do shopping', null),
  (6, 'E-Volt SE', 'Av. Dr. José Tomaz D''Avila Nabuco, 945', 'Farolândia', -10.96965, -37.06086, true, 'livre', now() - interval '75 minutes', 'usuarios', 1, 3, 2, 50, null, 'A confirmar', null),
  (7, 'Shopping Jardins', 'Av. Min. Geraldo Barreto Sobral, 215', 'Jardins', -10.943, -37.0595, false, 'livre', now() - interval '2 minutes', 'usuarios', 5, 2, 1, 7.5, null, 'Horário do shopping', 4),
  (8, 'Pátio Jardim', 'Av. Hélio de Souza Leão, 669, Loja 17', 'Jardins', -10.95044, -37.05818, true, 'livre', now() - interval '28 minutes', 'usuarios', 2, 2, 2, 47, null, 'A confirmar', null),
  (9, 'BYD – Terra Santa', 'R. Manoel Joaquim Correia, 40', 'Grageru', -10.946, -37.0641, true, 'ocupado', now() - interval '12 minutes', 'operadora', 3, 4, 0, 60, null, 'A confirmar', null),
  (10, 'Assaí Atacadista', 'Av. Adélia Franco, 3735', 'Grageru', -10.94854, -37.07172, true, 'livre', now() - interval '35 minutes', 'usuarios', 2, 2, 2, 7, null, 'Horário da loja', 4),
  (11, 'Pão de Açúcar – Jardins', 'R. José Seabra Batista, s/n', 'Jardins', -10.94206, -37.05676, true, 'fora_do_ar', now() - interval '130 minutes', 'usuarios', 1, 2, 0, 22, null, 'Horário da loja', null),
  (12, 'Memorial de Sergipe – Orla de Atalaia', 'SE-100, 60', 'Coroa do Meio / Atalaia', -10.98557, -37.04635, true, 'livre', now() - interval '8 minutes', 'usuarios', 3, 2, 2, 50, null, 'A confirmar', null),
  (13, 'Maisvolt – Tancredo Neves', 'Av. Pres. Tancredo Neves, 3481', 'Jabotiana', -10.929, -37.0813, true, 'livre', now() - interval '22 minutes', 'usuarios', 2, 2, 1, 50, null, 'A confirmar', null),
  (14, 'Volvo – Concessionária Stark', 'Av. Pres. Tancredo Neves, 3960', 'Ponto Novo', -10.9336, -37.0826, true, 'fora_do_ar', now() - interval '210 minutes', 'operadora', 2, 1, 0, 7, null, 'Horário da concessionária', null),
  (15, 'Hotel Costa by Nobile', 'Av. Santos Dumont, 1807', 'Coroa do Meio', -10.972, -37.0367, true, 'livre', now() - interval '41 minutes', 'usuarios', 1, 1, 1, 7, null, 'A confirmar', null),
  (16, 'Posto Petrox', 'Av. Monteiro Lobato, 900', 'Atalaia', -10.98508, -37.05541, true, 'fora_do_ar', now() - interval '274 minutes', 'usuarios', 1, 1, 0, null, null, 'A confirmar', null),
  (17, 'Petrox Beira Mar', 'Av. Gov. Paulo Barreto de Menezes, 662', 'Farolândia', -10.97042, -37.05384, true, 'fora_do_ar', now() - interval '191 minutes', 'usuarios', 1, 2, 0, null, null, 'A confirmar', null),
  (18, 'Mix Mateus', 'Av. João Rodrigues, 592', 'Industrial', -10.89521, -37.05127, true, 'livre', now() - interval '30 minutes', 'usuarios', 1, 2, 2, null, null, 'A confirmar', null),
  (19, 'Ibis Aracaju', 'Av. Adélia Franco, 2719', 'Grageru', -10.93943, -37.06385, true, 'ocupado', now() - interval '67 minutes', 'usuarios', 3, 1, 0, null, null, 'A confirmar', null),
  (20, 'Biofit', 'Av. Mario Jorge Menezes Viêira, 2200', 'Coroa do Meio', -10.95882, -37.04313, true, 'livre', now() - interval '56 minutes', 'usuarios', 2, 2, 1, null, null, 'A confirmar', null),
  (21, 'CABM Mall', 'R. Monsenhor Olívio Teixeira, 1333', 'Jardins', -10.94756, -37.05749, true, 'fora_do_ar', now() - interval '173 minutes', 'usuarios', 1, 2, 0, null, null, 'A confirmar', null),
  (22, 'Village Mall Atalaia', 'Rua Deputado Clóvis Rollemberg, 227', 'Atalaia', -10.99689, -37.05631, true, 'fora_do_ar', now() - interval '215 minutes', 'operadora', 1, 1, 0, null, null, 'A confirmar', null),
  (23, 'Escolinha De Futebol Rocket Power', 'Av. Francisco Freitas Bendocchi Alves, 480', 'Jardins', -10.94713, -37.05832, true, 'livre', now() - interval '42 minutes', 'usuarios', 1, 2, 2, null, null, 'A confirmar', null),
  (24, 'BMJ - Caju Gastrô', 'Rua José Luiz da Conceição, 220', 'Jardins', -10.94493, -37.0574, true, 'ocupado', now() - interval '61 minutes', 'usuarios', 3, 1, 0, null, null, 'A confirmar', null),
  (25, 'EcoGreen Estacionamento Unit', 'Av. Murilo Dantas, 1150', 'Farolândia', -10.96965, -37.06086, true, 'livre', now() - interval '30 minutes', 'usuarios', 1, 3, 2, null, null, 'A confirmar', null),
  (26, 'MaisVolt - Farolândia', 'Av. Murilo Dantas, 242', 'Farolândia', -10.96983, -37.06056, true, 'livre', now() - interval '21 minutes', 'operadora', 5, 2, 2, null, null, 'A confirmar', null),
  (27, 'Centro Médico Jouberto Uchoa', 'Av. Mario Jorge Menezes Viêira, 2375', 'Coroa do Meio', -10.95899, -37.04283, true, 'ocupado', now() - interval '67 minutes', 'usuarios', 3, 2, 0, null, null, 'A confirmar', null),
  (28, 'Gotec Recarga São Conrado', 'Av. São Cristóvão, 4171', 'São Conrado', -10.97014, -37.08284, true, 'ocupado', now() - interval '63 minutes', 'usuarios', 3, 2, 0, null, null, 'A confirmar', null),
  (29, 'Rede ELLO', 'R. José Carvalho Pinto, 280', 'Jardins', -10.9424, -37.05473, true, 'livre', now() - interval '22 minutes', 'operadora', 5, 1, 1, null, null, 'A confirmar', null),
  (30, 'Faraó Na Praia', 'Av. Inácio Barbosa, 13735', 'Aruana', -11.01487, -37.06827, true, 'livre', now() - interval '56 minutes', 'usuarios', 2, 2, 1, null, null, 'A confirmar', null),
  (31, 'Smart Home Tecnologia E Inovações', 'R. Cap. Benedito Teófilo Otoní, 477', '13 de Julho', -10.93077, -37.0478, true, 'livre', now() - interval '20 minutes', 'operadora', 5, 1, 1, null, null, 'A confirmar', null),
  (32, 'VAPT Mix Mateus', 'R. Nossa Sra. de Fátima, 438', 'José Conrado de Araújo', -10.90606, -37.08322, true, 'ocupado', now() - interval '67 minutes', 'usuarios', 3, 2, 0, null, null, 'A confirmar', null),
  (33, 'Centro Automotivo Mota', 'R. Paulo Henrique Machado Pímentel, 125', 'Inácio Barbosa', -10.95213, -37.07195, true, 'livre', now() - interval '41 minutes', 'usuarios', 1, 1, 1, null, null, 'A confirmar', null),
  (34, 'Gotec Energia Solar', 'Rua José Deodato Soares 312', 'Ponto Novo', -10.94, -37.0778, true, 'livre', now() - interval '36 minutes', 'usuarios', 1, 1, 1, null, null, 'A confirmar', null),
  (35, 'Movida Aluguel de Carros', 'Estacionamento', 'Aeroporto', -10.9843, -37.0703, true, 'ocupado', now() - interval '69 minutes', 'usuarios', 3, 1, 0, null, null, 'A confirmar', null),
  (36, 'Peugeot - Gama', 'Av. Pres. Tancredo Neves, 3402', 'Ponto Novo', -10.93911, -37.08101, true, 'ocupado', now() - interval '67 minutes', 'usuarios', 3, 2, 0, null, null, 'A confirmar', null),
  (37, 'Pneus Center', 'Av. Des. Maynard, 312', 'Suíça', -10.92668, -37.06241, true, 'livre', now() - interval '36 minutes', 'usuarios', 1, 2, 2, null, null, 'A confirmar', null),
  (38, 'Sam''s Club', 'Av. Deputado Sílvio Teixeira, 870', 'Jardins', -10.94283, -37.05638, true, 'livre', now() - interval '49 minutes', 'usuarios', 2, 2, 2, null, null, 'A confirmar', null),
  (39, 'Super Cachorro Quente Imperial', 'R. Riachão, 1152', 'Suíça', -10.92419, -37.06075, true, 'livre', now() - interval '34 minutes', 'usuarios', 1, 2, 2, null, null, 'A confirmar', null),
  (40, 'VAPT Toldos Deda', 'R. Prof. José de Lima Peixoto, 125', 'Grageru', -10.94595, -37.0685, true, 'livre', now() - interval '42 minutes', 'usuarios', 1, 2, 2, null, null, 'A confirmar', null),
  (41, 'Auto Peças Vieira', 'Rua Acre, 2186 A', 'Siqueira Campos', -10.91637, -37.07167, true, 'livre', now() - interval '26 minutes', 'operadora', 5, 1, 1, null, null, 'A confirmar', null),
  (42, 'Autotech Premium', 'R. Jurandi Gomes de Santana, 75', 'Ponto Novo', -10.92868, -37.07836, true, 'livre', now() - interval '54 minutes', 'usuarios', 2, 2, 2, null, null, 'A confirmar', null),
  (43, 'Chevrolet - Contorno', 'Av. Pres. Tancredo Neves, 1550', 'Jardins', -10.95239, -37.05887, true, 'livre', now() - interval '37 minutes', 'usuarios', 1, 1, 1, null, null, 'A confirmar', null),
  (44, 'Gotec Recarga Braúna', 'Av. Maranhão, 2462', 'Santos Dumont', -10.90305, -37.08483, true, 'livre', now() - interval '43 minutes', 'usuarios', 2, 1, 1, null, null, 'A confirmar', null),
  (45, 'Jefferson', 'R. Srg. Antônio da Silva Viêira, 93', 'São Conrado', -10.96647, -37.08366, true, 'ocupado', now() - interval '5 minutes', 'usuarios', 4, 1, 0, null, null, 'A confirmar', null),
  (46, 'Nissan - Sanvel', 'Av. Pres. Tancredo Neves, 640', 'Jardins', -10.95256, -37.05856, true, 'livre', now() - interval '24 minutes', 'operadora', 5, 1, 1, null, null, 'A confirmar', null),
  (47, 'Vidro X', 'Av. Melício Machado, 205', 'Atalaia', -10.98627, -37.05879, true, 'livre', now() - interval '21 minutes', 'operadora', 5, 1, 1, null, null, 'A confirmar', null);

insert into posto_conector (posto_id, conector_tipo_id) values
  (1, 1),
  (1, 2),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 1),
  (6, 2),
  (7, 2),
  (8, 1),
  (9, 1),
  (9, 2),
  (10, 2),
  (11, 2),
  (12, 1),
  (13, 1),
  (14, 2),
  (15, 2),
  (16, 2),
  (17, 1),
  (18, 1),
  (19, 2),
  (20, 2),
  (20, 1),
  (21, 2),
  (21, 5),
  (22, 2),
  (23, 1),
  (24, 1),
  (24, 2),
  (25, 2),
  (25, 1),
  (26, 1),
  (27, 2),
  (28, 1),
  (29, 1),
  (29, 2),
  (30, 2),
  (31, 2),
  (32, 1),
  (33, 2),
  (34, 2),
  (35, 2),
  (36, 2),
  (36, 1),
  (37, 2),
  (37, 4),
  (38, 1),
  (38, 2),
  (39, 2),
  (40, 1),
  (41, 2),
  (42, 1),
  (42, 2),
  (43, 2),
  (44, 1),
  (45, 2),
  (46, 2),
  (47, 1);

-- 5. Parceiros, ofertas e cupons ---------------------------------------
insert into parceiro (id, nome) values
  (1, 'Parceiro (exemplo)'),
  (2, 'MAPERE Parceiros');

insert into oferta (posto_id, parceiro_id, descricao, ativa) values
  (1, 1, '15% off em cafés', true),
  (4, 1, 'Lavagem 20% off', true),
  (5, 1, 'Ingresso 2x1 no cinema', true),
  (7, 1, 'R$ 5 off na praça de alimentação', true),
  (12, 1, 'Água de coco grátis', true);

insert into cupom (id, titulo, descricao, custo_pontos, parceiro_id) values
  (1, 'Cafe gratis',            'Um cafe expresso apos carregar em um posto parceiro.', 40,  1),
  (2, 'Lavagem 20% off',        'Vale para lavagem simples ou completa.',               80,  1),
  (3, 'Ingresso 2x1 no cinema', 'Segunda a quinta, sessoes regulares.',                 120, 1),
  (4, 'R$ 20 em energia',       'Credito para carga nos postos parceiros.',             200, 2);

insert into resgate_cupom (usuario_id, cupom_id, codigo) values
  (3, 1, 'MAPERE-CAFE-0001'),
  (3, 2, 'MAPERE-LAV-0001');

-- 6. Etiquetas, avaliacoes e problemas ---------------------------------
insert into etiqueta (id, nome) values
  (1, 'Carga rapida de verdade'),
  (2, 'Facil de achar'),
  (3, 'Bem iluminado a noite'),
  (4, 'Preco justo'),
  (5, 'Costuma ter fila'),
  (6, 'Vaga ocupada por carro a combustao');

insert into avaliacao (id, posto_id, usuario_id, status_informado, nota, comentario, pontos_ganhos, criado_em) values
  (1, 7,  1, 'livre',      5,    'Carregou rapido e tinha vaga.',            15, now() - interval '3 minutes'),
  (2, 7,  3, 'livre',      4,    null,                                       15, now() - interval '2 hours'),
  (3, 5,  2, 'ocupado',    3,    'Duas pessoas esperando.',                  15, now() - interval '20 minutes'),
  (4, 1,  1, 'livre',      null, null,                                       10, now() - interval '1 day'),
  (5, 11, 3, 'fora_do_ar', 1,    'Tela do totem apagada.',                   15, now() - interval '2 hours 10 minutes'),
  (6, 4,  2, 'livre',      5,    'Otimo atendimento.',                       15, now() - interval '35 minutes'),
  (7, 10, 3, 'livre',      4,    null,                                       15, now() - interval '5 hours'),
  (8, 12, 1, 'livre',      5,    'Vista linda enquanto carrega.',            15, now() - interval '8 minutes');

insert into avaliacao_etiqueta (avaliacao_id, etiqueta_id) values
  (1, 1), (1, 2),
  (2, 4),
  (3, 5),
  (6, 1), (6, 3),
  (8, 2), (8, 3);

insert into problema_reportado (posto_id, usuario_id, motivo, criado_em) values
  (11, 3, 'sem_energia',            now() - interval '2 hours'),
  (14, 2, 'conector_danificado',    now() - interval '3 hours 30 minutes'),
  (5,  1, 'vaga_ocupada_combustao', now() - interval '45 minutes');

-- 7. Favoritos, alertas e reservas -------------------------------------
insert into favorito (usuario_id, posto_id) values
  (1, 7), (1, 12), (2, 4), (3, 1), (3, 7);

insert into alerta_liberacao (usuario_id, posto_id, ativo) values
  (1, 5, true),
  (2, 2, true),
  (3, 9, false);

insert into reserva (posto_id, usuario_id, duracao_min, valor, inicio, fim, status) values
  (1, 1, 15, 3.00, now(),                       now() + interval '15 minutes', 'ativa'),
  (4, 2, 30, 5.00, now() - interval '1 day',    now() - interval '1 day' + interval '30 minutes', 'concluida'),
  (7, 3, 45, 7.00, now() - interval '2 days',   now() - interval '2 days' + interval '45 minutes', 'expirada');

-- 8. Indicadores do painel do dono (postos 7 e 10) ----------------------
insert into estatistica_posto_dia (posto_id, data, visualizacoes, rotas_iniciadas, checkins, kwh_vendidos) values
  (7,  current_date,     142, 31, 9, 64.50),
  (7,  current_date - 1, 168, 40, 12, 81.00),
  (7,  current_date - 2, 121, 25, 7, 50.25),
  (10, current_date,     88,  14, 4, 38.00),
  (10, current_date - 1, 95,  18, 5, 44.75),
  (10, current_date - 2, 70,  10, 3, 27.50);

-- 9. Ajusta os contadores de ID (os inserts acima usaram IDs explicitos) -
select setval(pg_get_serial_sequence('conector_tipo', 'id'), (select max(id) from conector_tipo));
select setval(pg_get_serial_sequence('carro_modelo',  'id'), (select max(id) from carro_modelo));
select setval(pg_get_serial_sequence('usuario',       'id'), (select max(id) from usuario));
select setval(pg_get_serial_sequence('posto',         'id'), (select max(id) from posto));
select setval(pg_get_serial_sequence('parceiro',      'id'), (select max(id) from parceiro));
select setval(pg_get_serial_sequence('cupom',         'id'), (select max(id) from cupom));
select setval(pg_get_serial_sequence('etiqueta',      'id'), (select max(id) from etiqueta));
select setval(pg_get_serial_sequence('avaliacao',     'id'), (select max(id) from avaliacao));
