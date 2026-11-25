-- Consultas para tirar os prints das tabelas com dados inseridos.
-- Rode uma por vez no SQL Editor do Supabase (ou abra a tabela no Table Editor)
-- e salve o print nesta pasta com o nome da tabela, ex.: posto.png

select * from conector_tipo          order by id;
select * from carro_modelo           order by id;
select * from carro_modelo_conector  order by carro_modelo_id, conector_tipo_id;
select * from usuario                order by id;
select * from posto                  order by id;           -- 47 linhas
select * from posto_conector         order by posto_id, conector_tipo_id;
select * from parceiro               order by id;
select * from oferta                 order by id;
select * from etiqueta               order by id;
select * from avaliacao              order by id;
select * from avaliacao_etiqueta     order by avaliacao_id, etiqueta_id;
select * from problema_reportado     order by id;
select * from favorito               order by usuario_id, posto_id;
select * from alerta_liberacao       order by usuario_id, posto_id;
select * from reserva                order by id;
select * from cupom                  order by id;
select * from resgate_cupom          order by id;
select * from estatistica_posto_dia  order by posto_id, data;

-- Contagem de linhas de todas as tabelas (um print so)
select 'conector_tipo' as tabela, count(*) as linhas from conector_tipo
union all select 'carro_modelo',          count(*) from carro_modelo
union all select 'carro_modelo_conector', count(*) from carro_modelo_conector
union all select 'usuario',               count(*) from usuario
union all select 'posto',                 count(*) from posto
union all select 'posto_conector',        count(*) from posto_conector
union all select 'parceiro',              count(*) from parceiro
union all select 'oferta',                count(*) from oferta
union all select 'etiqueta',              count(*) from etiqueta
union all select 'avaliacao',             count(*) from avaliacao
union all select 'avaliacao_etiqueta',    count(*) from avaliacao_etiqueta
union all select 'problema_reportado',    count(*) from problema_reportado
union all select 'favorito',              count(*) from favorito
union all select 'alerta_liberacao',      count(*) from alerta_liberacao
union all select 'reserva',               count(*) from reserva
union all select 'cupom',                 count(*) from cupom
union all select 'resgate_cupom',         count(*) from resgate_cupom
union all select 'estatistica_posto_dia', count(*) from estatistica_posto_dia;
