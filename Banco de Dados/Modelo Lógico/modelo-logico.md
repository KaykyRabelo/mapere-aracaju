# Modelo Lógico do MAPERE

Tabelas, colunas, chaves primárias (PK) e estrangeiras (FK). Os nomes batem com o script `Tabelas/01_create_tables.sql`. O diagrama aparece desenhado direto no GitHub.

```mermaid
erDiagram
    CONECTOR_TIPO {
        smallint id PK
        varchar nome UK
    }
    CARRO_MODELO {
        smallint id PK
        varchar nome UK
        numeric potencia_max_kw
    }
    CARRO_MODELO_CONECTOR {
        smallint carro_modelo_id PK, FK
        smallint conector_tipo_id PK, FK
    }
    USUARIO {
        integer id PK
        varchar nome
        varchar email UK
        varchar telefone UK
        varchar perfil
        varchar nome_estabelecimento
        smallint carro_modelo_id FK
        integer pontos
        timestamptz criado_em
    }
    POSTO {
        integer id PK
        varchar nome
        varchar endereco
        varchar bairro
        numeric latitude
        numeric longitude
        boolean posicao_aproximada
        varchar status
        timestamptz status_atualizado_em
        varchar fonte_status
        smallint confirmacoes
        smallint vagas_total
        smallint vagas_livres
        numeric potencia_kw
        numeric preco_kwh
        varchar horario
        integer dono_id FK
    }
    POSTO_CONECTOR {
        integer posto_id PK, FK
        smallint conector_tipo_id PK, FK
    }
    PARCEIRO {
        integer id PK
        varchar nome UK
    }
    OFERTA {
        integer id PK
        integer posto_id FK
        integer parceiro_id FK
        varchar descricao
        boolean ativa
    }
    ETIQUETA {
        smallint id PK
        varchar nome UK
    }
    AVALIACAO {
        integer id PK
        integer posto_id FK
        integer usuario_id FK
        varchar status_informado
        smallint nota
        varchar comentario
        text foto_url
        smallint pontos_ganhos
        timestamptz criado_em
    }
    AVALIACAO_ETIQUETA {
        integer avaliacao_id PK, FK
        smallint etiqueta_id PK, FK
    }
    PROBLEMA_REPORTADO {
        integer id PK
        integer posto_id FK
        integer usuario_id FK
        varchar motivo
        timestamptz criado_em
    }
    FAVORITO {
        integer usuario_id PK, FK
        integer posto_id PK, FK
        timestamptz criado_em
    }
    ALERTA_LIBERACAO {
        integer usuario_id PK, FK
        integer posto_id PK, FK
        boolean ativo
        timestamptz criado_em
    }
    RESERVA {
        integer id PK
        integer posto_id FK
        integer usuario_id FK
        smallint duracao_min
        numeric valor
        timestamptz inicio
        timestamptz fim
        varchar status
    }
    CUPOM {
        integer id PK
        varchar titulo UK
        varchar descricao
        integer custo_pontos
        integer parceiro_id FK
    }
    RESGATE_CUPOM {
        integer id PK
        integer usuario_id FK
        integer cupom_id FK
        varchar codigo UK
        timestamptz resgatado_em
    }
    ESTATISTICA_POSTO_DIA {
        integer posto_id PK, FK
        date data PK
        integer visualizacoes
        integer rotas_iniciadas
        integer checkins
        numeric kwh_vendidos
    }

    CARRO_MODELO ||--o{ CARRO_MODELO_CONECTOR : possui
    CONECTOR_TIPO ||--o{ CARRO_MODELO_CONECTOR : aceito_em
    CARRO_MODELO |o--o{ USUARIO : dirigido_por
    USUARIO |o--o{ POSTO : dono_de
    POSTO ||--o{ POSTO_CONECTOR : possui
    CONECTOR_TIPO ||--o{ POSTO_CONECTOR : oferecido_em
    POSTO ||--o{ OFERTA : tem
    PARCEIRO ||--o{ OFERTA : patrocina
    PARCEIRO ||--o{ CUPOM : emite
    USUARIO ||--o{ AVALIACAO : faz
    POSTO ||--o{ AVALIACAO : recebe
    AVALIACAO ||--o{ AVALIACAO_ETIQUETA : marcada
    ETIQUETA ||--o{ AVALIACAO_ETIQUETA : usada
    USUARIO ||--o{ PROBLEMA_REPORTADO : reporta
    POSTO ||--o{ PROBLEMA_REPORTADO : tem
    USUARIO ||--o{ FAVORITO : salva
    POSTO ||--o{ FAVORITO : favoritado
    USUARIO ||--o{ ALERTA_LIBERACAO : pede
    POSTO ||--o{ ALERTA_LIBERACAO : gera
    USUARIO ||--o{ RESERVA : faz
    POSTO ||--o{ RESERVA : recebe
    USUARIO ||--o{ RESGATE_CUPOM : resgata
    CUPOM ||--o{ RESGATE_CUPOM : resgatado
    POSTO ||--o{ ESTATISTICA_POSTO_DIA : gera
```

## Regras que viraram constraints

| Regra do produto | Constraint |
|---|---|
| Status só pode ser Livre, Ocupado ou Fora do ar | `ck_posto_status`, `ck_avaliacao_status` |
| Fonte do status: Usuários ou Operadora | `ck_posto_fonte` |
| Vagas livres nunca passam das vagas totais | `ck_posto_vagas` |
| Potência e preço podem ser desconhecidos ("a confirmar") | `potencia_kw` e `preco_kwh` aceitam `null` |
| Nota da avaliação vai de 1 a 5 | `ck_avaliacao_nota` |
| Reserva: 15 min = R$ 3, 30 min = R$ 5, 45 min = R$ 7 | `ck_reserva_duracao_valor` |
| Dono de posto precisa ter o nome do estabelecimento | `ck_usuario_dono_estab` |
| E-mail e telefone não se repetem | `uq_usuario_email`, `uq_usuario_tel` |
| Cada usuário resgata um cupom uma vez | `uq_resgate_usuario_cupom` |
| Não apagar plugue que está em uso | `on delete restrict` em `fk_pc_conector` |

## Normalização

Todas as tabelas estão na 3ª forma normal: valores atômicos, nenhuma coluna depende de parte de uma chave composta, e nenhuma coluna não-chave depende de outra não-chave. Dados que se repetem (plugues, parceiros, etiquetas) ficam em tabelas próprias.

> **Para entregar à professora:** refaça este diagrama no BRModelo (modelo lógico), tire o print e salve nesta pasta. O arquivo `.md` serve de guia.
