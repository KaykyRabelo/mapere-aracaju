# MAPERE — Aracaju

O MAPERE é um aplicativo web (PWA) que mostra **se um eletroposto está livre e funcionando agora**, sempre com a **fonte e a idade da informação** ("Atualizado há 4 min · 5 confirmações · fonte: Usuários").

Protótipo clicável publicado em: https://mapere-aracaju.vercel.app

## O problema

O motorista de carro elétrico chega ao posto e ele está ocupado, quebrado ou offline. O status que ele viu antes de sair não correspondia à realidade, e isso gera tempo perdido no trânsito e, para quem dirige por aplicativo, corrida perdida. Os apps de mapa mostram só *onde* há carregador, e os apps de operadora só ativam e cobram. Falta um produto cujo objetivo central seja a disponibilidade confiável.

## A solução

- **Idade da informação sempre visível**, com selo de verificado quando há 3 ou mais confirmações nos últimos 15 minutos.
- **Check-in e aviso de problema em 1 a 2 toques**, com nota, etiquetas, foto e comentário opcionais.
- **Filtro por plugue e potência do carro** (CCS2, Type 2, CHAdeMO, GB/T).
- **Recompensa real:** pontos que viram cupons em parceiros (café, lavagem, cinema, crédito de energia).
- **Alternativa inteligente:** se o posto está lotado, o app mostra o compatível e livre mais próximo.
- **Reserva de vaga** de 15, 30 ou 45 minutos (R$ 3, R$ 5 ou R$ 7).
- **Painel do dono do posto** para atualizar status, preço, vagas e criar ofertas.

## Quem usa

| Perfil | O que precisa |
|---|---|
| Motorista de aplicativo | Saber rápido se o posto está livre e ter alternativa quando estiver ocupado |
| Dono de carro elétrico recente | Postos compatíveis com o plugue do seu carro |
| Dono de posto / operador | Manter o status correto e vender mais energia |
| Visitante | Consultar o mapa sem criar conta |

## Dados do protótipo

- **Reais:** 47 eletropostos de Aracaju (nome, endereço, plugues e potência), de listas públicas.
- **Simulados:** status, idade da informação, vagas livres, avaliações, parceiros, pontos e usuários. Os e-mails de teste usam `@example.com`.

## Tecnologias

- Site estático em HTML, CSS e JavaScript, com mapa OpenStreetMap + Leaflet.
- Publicação na Vercel (cada push na `main` publica em produção).
- Banco de dados: PostgreSQL no **Supabase**.

## Banco de dados

Toda a documentação do banco está na pasta [`Banco de Dados`](Banco%20de%20Dados):

| Pasta | Conteúdo |
|---|---|
| [`Diagrama Conceitual`](Banco%20de%20Dados/Diagrama%20Conceitual) | Entidades e relacionamentos (DER) |
| [`Modelo Lógico`](Banco%20de%20Dados/Modelo%20L%C3%B3gico) | Tabelas, colunas, chaves PK/FK e regras |
| [`Modelo Esquema no Supabase`](Banco%20de%20Dados/Modelo%20Esquema%20no%20Supabase) | Prints do esquema dentro do Supabase |
| [`Tabelas`](Banco%20de%20Dados/Tabelas) | `01_create_tables.sql`: CREATE TABLE com todas as constraints |
| [`Testes`](Banco%20de%20Dados/Testes) | `02_insert_into.sql` (INSERT INTO) e `03_alter_table.sql` (ALTER TABLE e testes das constraints) |
| [`Dados`](Banco%20de%20Dados/Dados) | Prints das tabelas com dados inseridos |

O banco tem **18 tabelas**: `conector_tipo`, `carro_modelo`, `carro_modelo_conector`, `usuario`, `posto`, `posto_conector`, `parceiro`, `oferta`, `etiqueta`, `avaliacao`, `avaliacao_etiqueta`, `problema_reportado`, `favorito`, `alerta_liberacao`, `reserva`, `cupom`, `resgate_cupom` e `estatistica_posto_dia`.

### Como rodar no Supabase

1. Crie um projeto em [supabase.com/dashboard](https://supabase.com/dashboard).
2. Abra **SQL Editor** e rode, nesta ordem:
   1. `Banco de Dados/Tabelas/01_create_tables.sql`
   2. `Banco de Dados/Testes/02_insert_into.sql`
   3. `Banco de Dados/Testes/03_alter_table.sql`
3. Confira os dados no **Table Editor** e o esquema em **Database > Schema Visualizer**.

## Links

- **Supabase (link público):** _colar aqui o link do projeto_
- **BRModelo, modelo conceitual (link público):** https://app.brmodeloweb.com/publicview/6b0731c11448006b56802e27
- **BRModelo, modelo lógico (link público):** https://app.brmodeloweb.com/publicview/6b072f7a1448006b56802c9f
- **Protótipo:** https://mapere-aracaju.vercel.app

## Squad

_Colar aqui o nome da squad e dos integrantes._
