-- =====================================================================
-- MAPERE - Banco de dados (PostgreSQL / Supabase)
-- Script 03: ALTER TABLE (evolucao do esquema) e testes das constraints
--
-- Rodar DEPOIS de 01_create_tables.sql e 02_insert_into.sql.
-- =====================================================================

-- ---------------------------------------------------------------------
-- A. Adicionar colunas
-- ---------------------------------------------------------------------
-- Telefone confirmado por codigo SMS (login por celular)
alter table usuario
    add column telefone_verificado boolean not null default false;

-- Observacao livre do operador sobre o posto
alter table posto
    add column observacao varchar(200);

-- Nivel de fidelidade calculado a partir dos pontos (Bronze/Prata/Ouro)
alter table usuario
    add column nivel varchar(10) not null default 'bronze';

-- ---------------------------------------------------------------------
-- B. Adicionar constraints
-- ---------------------------------------------------------------------
alter table usuario
    add constraint ck_usuario_nivel check (nivel in ('bronze', 'prata', 'ouro'));

-- Um mesmo usuario nao pode ter duas reservas ativas ao mesmo tempo
create unique index uq_reserva_ativa_usuario
    on reserva (usuario_id) where status = 'ativa';

-- ---------------------------------------------------------------------
-- C. Alterar coluna (tipo, default, obrigatoriedade)
-- ---------------------------------------------------------------------
alter table posto
    alter column horario type varchar(80);

alter table avaliacao
    alter column pontos_ganhos set default 15;

alter table posto
    alter column bairro set not null;

-- ---------------------------------------------------------------------
-- D. Renomear
-- ---------------------------------------------------------------------
alter table posto rename column observacao to observacao_operador;

-- ---------------------------------------------------------------------
-- E. Atualizar o nivel com base nos pontos e conferir
--    Bronze < 80 | Prata 80-199 | Ouro >= 200
-- ---------------------------------------------------------------------
update usuario set nivel = case
    when pontos >= 200 then 'ouro'
    when pontos >= 80  then 'prata'
    else 'bronze'
end;

select id, nome, pontos, nivel from usuario order by id;

-- ---------------------------------------------------------------------
-- F. Remover constraint e coluna
-- ---------------------------------------------------------------------
alter table cupom drop constraint uq_cupom_titulo;
alter table cupom add  constraint uq_cupom_titulo unique (titulo);

alter table posto drop column observacao_operador;

-- ---------------------------------------------------------------------
-- G. Testes das constraints: CADA comando abaixo deve FALHAR.
--    Descomente um por vez e rode para ver a mensagem de erro (para o print).
-- ---------------------------------------------------------------------
-- Status invalido (viola ck_posto_status):
-- update posto set status = 'quebrado' where id = 1;

-- Mais vagas livres do que vagas totais (viola ck_posto_vagas):
-- update posto set vagas_livres = 99 where id = 1;

-- Nota fora de 1 a 5 (viola ck_avaliacao_nota):
-- insert into avaliacao (posto_id, usuario_id, status_informado, nota) values (1, 1, 'livre', 6);

-- E-mail repetido (viola uq_usuario_email):
-- insert into usuario (nome, email) values ('Outra Pessoa', 'marcos@example.com');

-- Dono de posto sem estabelecimento (viola ck_usuario_dono_estab):
-- insert into usuario (nome, email, perfil) values ('Dono sem posto', 'dono2@example.com', 'dono_posto');

-- Reserva de 20 minutos (viola ck_reserva_duracao_valor):
-- insert into reserva (posto_id, usuario_id, duracao_min, valor, fim) values (1, 1, 20, 4.00, now() + interval '20 minutes');

-- Posto inexistente (viola fk_avaliacao_posto):
-- insert into avaliacao (posto_id, usuario_id, status_informado) values (9999, 1, 'livre');

-- Apagar um plugue que esta em uso (viola fk_pc_conector, on delete restrict):
-- delete from conector_tipo where id = 1;

-- ---------------------------------------------------------------------
-- H. (Opcional, Supabase) Seguranca por linha. Habilita RLS no posto e
--    libera leitura publica. Sem politica, a API publica nao le a tabela.
-- ---------------------------------------------------------------------
-- alter table posto enable row level security;
-- create policy "posto_leitura_publica" on posto for select using (true);
