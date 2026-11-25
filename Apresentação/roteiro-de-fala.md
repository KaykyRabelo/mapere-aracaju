# Roteiro de fala — MAPERE, banco de dados

Tempo total: cerca de 5 minutos. O vídeo `mapere-motion.mp4` (46 segundos, sem áudio) roda na TV durante a abertura. Depois, você passa pelos slides.

## Parte 1 — Abertura com o vídeo (46 s)

Dê o play no vídeo e fale junto, no ritmo das cenas.

| Tempo | Na TV | O que dizer |
|---|---|---|
| 0–6 s | “Você chega ao eletroposto. Ocupado. Quebrado. Fora do ar.” | “Quem tem carro elétrico conhece essa cena: você chega ao eletroposto e ele está ocupado, quebrado ou fora do ar.” |
| 6–13 s | “O MAPERE mostra se o posto está livre, agora.” | “O MAPERE resolve isso. Ele mostra se o posto está livre agora, e há quanto tempo essa informação foi atualizada.” |
| 13–23 s | Tela real do app, com 3 destaques | “O motorista vê o status por cor, vê a idade da informação e filtra pelo plugue e pela potência do carro dele.” |
| 23–33 s | Diagrama conceitual e depois o lógico | “Por trás do app existe um banco de dados PostgreSQL. Modelamos primeiro o conceitual e depois o lógico, no BRModelo.” |
| 33–40 s | 18 · 47 · 59 · 8 | “São 18 tabelas, 47 postos reais de Aracaju, 59 vínculos entre postos e plugues e 8 testes de regra.” |
| 40–46 s | Logo MAPERE | “Esse é o MAPERE. Agora vamos ver o banco por dentro.” |

## Parte 2 — Slides (cerca de 4 minutos)

**Slide 1 — Capa (10 s).** “Este é o projeto de banco de dados da nossa squad: o MAPERE, um app que mostra se o eletroposto está livre, agora.”

**Slide 2 — Problema e solução (30 s).** “O problema é que o status que o motorista vê antes de sair não bate com a realidade. Isso gera tempo perdido e, para quem dirige por aplicativo, corrida perdida. A solução é mostrar a disponibilidade com fonte e data: check-in em um ou dois toques, filtro por plugue, pontos que viram cupons e um painel para o dono do posto.”

**Slide 3 — O banco em números (20 s).** “O banco tem 18 tabelas. Os 47 postos são reais, de Aracaju: nome, endereço, plugue e potência vêm de listas públicas. O que é simulado é o status, as avaliações e os usuários. Os e-mails de teste usam example.com.”

**Slide 4 — Modelo conceitual (40 s).** “Este é o diagrama conceitual, feito no BRModelo. Ele tem 10 entidades e 16 relacionamentos. O usuário avalia, reserva, favorita e pede alerta de um posto. O posto oferece plugues, e o carro aceita plugues. Os números, como (0, n) e (1, 1), são a cardinalidade. Os relacionamentos muitos-para-muitos viram tabelas de ligação no modelo lógico.”

**Slide 5 — Modelo lógico (40 s).** “Aqui está o modelo lógico, com as 18 tabelas, as chaves primárias e as estrangeiras. As tabelas de ligação, como favorito e posto_conector, resolvem as relações N:N. Os nomes são os mesmos do script SQL.”

**Slide 6 — Quatro grupos de tabelas (25 s).** “Organizamos as tabelas em quatro grupos: catálogos, que guardam listas que se repetem, como plugues e parceiros; cadastros, como usuário e posto; interações, que são o que o motorista faz no app; e negócio, com reservas, resgate de cupom e os indicadores do dono.”

**Slide 7 — Constraints (35 s).** “As regras do produto estão no banco, não só no app. O status só aceita livre, ocupado ou fora do ar. As vagas livres nunca passam das vagas totais. A nota vai de 1 a 5. A reserva custa 3, 5 ou 7 reais conforme os minutos. Mesmo que alguém grave direto no banco, o dado errado é recusado.”

**Slide 8 — Scripts (30 s).** “São três scripts, nesta ordem: o primeiro cria as tabelas, o segundo insere os dados e o terceiro faz as alterações e os testes. No terceiro, os 8 testes de constraint ficam comentados: dá para descomentar um por vez e ver o erro.”

**Slide 9 — Entrega no GitHub (20 s).** “A pasta Banco de Dados segue o que foi pedido: diagrama conceitual, modelo lógico, esquema no Supabase, tabelas, testes e dados.”

**Slide 10 — Como rodar (20 s).** “Para rodar, cria-se o projeto no Supabase, executa-se os três scripts no SQL Editor e confere-se no Table Editor e no Schema Visualizer. Os links públicos do BRModelo e do Supabase estão no README.”

## Perguntas que podem aparecer

- **Por que 18 tabelas?** Porque cada relação muitos-para-muitos virou uma tabela de ligação, e os dados repetidos (plugues, parceiros, etiquetas) ficaram em catálogos. Isso deixa o banco na 3ª forma normal.
- **Os dados são reais?** Os 47 postos, sim: nome, endereço, plugue e potência. Status, avaliações, usuários e estatísticas são simulados.
- **Como o banco impede dado errado?** Com constraints: PK, FK, UNIQUE, CHECK, NOT NULL e DEFAULT. Os testes do script 03 mostram a recusa.
- **Onde fica a senha do usuário?** No Supabase Auth, não na tabela `usuario`.
- **Por que Supabase?** Porque é PostgreSQL pronto na nuvem, com SQL Editor, Table Editor e o Schema Visualizer para os prints.

## Antes de apresentar

- Colar o link público do Supabase no slide 10 e no README (ainda falta).
- Tirar os prints do Schema Visualizer e das tabelas com dados, e salvar nas pastas `Modelo Esquema no Supabase` e `Dados`.
- Testar o vídeo na TV antes: ele não tem som e roda 46 segundos.
