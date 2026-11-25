# Roteiro simples — MAPERE (2 pessoas: VOCÊ e CAIO)

Regra de ouro: fale devagar e aponte o dedo na tela.

## Como entender tudo em 1 minuto

- **Banco de dados** = uma planilha gigante com várias abas. Cada aba se chama **tabela**.
- **Tabela** = uma lista. Exemplo: a aba "posto" é a lista dos carregadores. A aba "usuario" é a lista das pessoas.
- **Coluna** = o título de cada coluna da lista (nome, endereço, status).
- **PK (chave primária)** = o "RG" de cada linha. É único e não repete.
- **FK (chave estrangeira)** = o número do RG de OUTRA aba. É assim que uma aba "liga" na outra.
- **Constraint** = o segurança da porta. Ele barra dado errado. Exemplo: nota 6 não entra, porque a nota vai de 1 a 5.
- **Diagrama conceitual** = o desenho de "quem conversa com quem". **Quadrado** = uma coisa (usuário, posto). **Losango** = o que acontece entre duas coisas (avalia, reserva).
- **(0, n)** = "pode ter nenhum ou vários". **(1, 1)** = "tem exatamente um".
- **Diagrama lógico** = o mesmo desenho, mas com as colunas escritas dentro de cada caixa.
- **Supabase** = o lugar na internet onde o banco mora.

## O que falar, na ordem

**1. Abertura (VOCÊ, 30 s) — dá o play no vídeo da TV**
"Quem tem carro elétrico chega no carregador e ele está ocupado ou quebrado. O MAPERE mostra se o carregador está livre agora. Nós fizemos o banco de dados que guarda essas informações."

**2. O que é o banco (CAIO, 30 s)**
"O banco é como uma planilha com várias abas. Nós temos 18 abas. Tem a aba dos carregadores, a das pessoas, a das avaliações e a das reservas."

**3. Diagrama conceitual (VOCÊ, 1 min) — slide 4**
"Esse desenho mostra quem conversa com quem. Cada quadrado é uma coisa: o usuário, o posto, o plugue. Cada losango é uma ação: o usuário avalia um posto, reserva um posto, favorita um posto. Os números são a quantidade: (0, n) quer dizer nenhum ou vários. Por exemplo, um posto pode ter várias avaliações, ou nenhuma."

**4. Diagrama lógico (CAIO, 1 min) — slide 5**
"Esse é o mesmo desenho, mas com as colunas dentro. PK é o RG da linha. FK é o RG de outra aba, que liga uma aba na outra. Por exemplo, a avaliação guarda o RG do usuário e o RG do posto. Assim a gente sabe quem avaliou o quê."

**5. Os dados (VOCÊ, 30 s) — slide 3**
"Os 47 carregadores são reais, de Aracaju. O status, as avaliações e os usuários são de mentira, só para teste."

**6. As regras (CAIO, 45 s) — slide 7**
"O banco tem seguranças. O status só pode ser livre, ocupado ou fora do ar. A nota só vai de 1 a 5. Vaga livre nunca passa do total de vagas. Se alguém tentar colocar dado errado, o banco recusa."

**7. Os scripts (VOCÊ, 30 s) — slide 8**
"Temos 3 arquivos. O primeiro cria as abas. O segundo coloca os dados. O terceiro muda e testa as regras."

**8. Supabase (CAIO, 30 s) — mostre o projeto aberto no navegador**
"O banco está no Supabase, na internet. Aqui está o projeto mapere-aracaju, com as 18 tabelas e os dados dentro. Pode abrir uma tabela para mostrar."

**9. Fechamento (VOCÊ, 15 s) — slide 10**
"Tudo está no GitHub, na pasta Banco de Dados. Obrigado."

## Se a professora perguntar

- **"Por que 18 tabelas?"** — "Porque cada lista vira uma aba. Quando duas coisas têm 'vários com vários', como posto e plugue, criamos uma aba só para ligar os dois."
- **"O que é chave primária?"** — "É o RG da linha. Não repete."
- **"O que é chave estrangeira?"** — "É o RG de outra aba. Liga uma aba na outra."
- **"Como o banco impede dado errado?"** — "Com constraints, que são as regras. Exemplo: a nota só aceita de 1 a 5."
- **"Os dados são reais?"** — "Os 47 postos, sim. O resto é de teste."
- **"Cadê a senha dos usuários?"** — "Fica no Supabase Auth, não na tabela."
- **"Cadê o link do Supabase?"** — "O projeto está aberto aqui. Podemos mandar o convite por e-mail."

## Antes de começar (2 minutos)

1. Abra os slides no seu navegador (o link é privado e só abre na sua conta): https://claude.ai/artifact/FD3uZwcRzsnPaF3Nv9VeCB
2. Abra o vídeo `Apresentação/mapere-motion.mp4` na TV.
3. Abra o projeto do Supabase em outra aba: https://supabase.com/dashboard/project/pdejoesxxumigzfkasnk/editor
4. Deixe o BRModelo aberto, se quiser mostrar o diagrama ao vivo: https://app.brmodeloweb.com/publicview/6b0731c11448006b56802e27
5. No slide 10 aparece "[colar o link]" no Supabase. Não leia essa linha. Mostre o projeto aberto no navegador.
