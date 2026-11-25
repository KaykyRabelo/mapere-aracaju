# Diagrama Conceitual (DER) do MAPERE

Feito no [BRModelo Web](https://www.brmodeloweb.com/). Link público do modelo: https://app.brmodeloweb.com/publicview/6b0731c11448006b56802e27

![Diagrama conceitual do MAPERE no BRModelo](diagrama-conceitual-brmodelo.png)

O desenho do BRModelo mostra as entidades principais, os relacionamentos com cardinalidade e os atributos mais importantes de cada entidade (a bolinha preenchida é a chave). O diagrama em Mermaid abaixo mostra só as entidades e as relações, sem colunas, e aparece desenhado direto no GitHub.

```mermaid
erDiagram
    USUARIO        }o--o| CARRO_MODELO   : "dirige"
    USUARIO        |o--o{ POSTO          : "e dono de"
    CARRO_MODELO   }o--o{ CONECTOR_TIPO  : "aceita"
    POSTO          }o--o{ CONECTOR_TIPO  : "oferece"
    POSTO          ||--o{ OFERTA         : "tem"
    PARCEIRO       ||--o{ OFERTA         : "patrocina"
    PARCEIRO       ||--o{ CUPOM          : "emite"
    USUARIO        ||--o{ AVALIACAO      : "faz"
    POSTO          ||--o{ AVALIACAO      : "recebe"
    AVALIACAO      }o--o{ ETIQUETA       : "marcada com"
    USUARIO        ||--o{ PROBLEMA_REPORTADO : "reporta"
    POSTO          ||--o{ PROBLEMA_REPORTADO : "tem"
    USUARIO        }o--o{ POSTO          : "favorita"
    USUARIO        }o--o{ POSTO          : "pede alerta de liberacao"
    USUARIO        ||--o{ RESERVA        : "faz"
    POSTO          ||--o{ RESERVA        : "recebe"
    USUARIO        }o--o{ CUPOM          : "resgata"
    POSTO          ||--o{ ESTATISTICA_POSTO_DIA : "gera"
```

## Entidades

| Entidade | O que representa |
|---|---|
| USUARIO | Motorista ou dono de posto (visitante não tem cadastro) |
| CARRO_MODELO | Modelo de carro elétrico usado no filtro "Meu carro" |
| CONECTOR_TIPO | Tipo de plugue: CCS2, Type 2, CHAdeMO, GB/T, Outro |
| POSTO | Eletroposto de Aracaju, com status, vagas, potência e preço |
| PARCEIRO | Comércio que dá benefícios (café, lavagem, cinema) |
| OFERTA | Benefício de um parceiro exibido em um posto |
| CUPOM | Vantagem que o motorista troca por pontos |
| AVALIACAO | Check-in com status, nota, foto e comentário |
| ETIQUETA | Marcador da avaliação ("Preço justo", "Costuma ter fila"...) |
| PROBLEMA_REPORTADO | Aviso de defeito (+15 pontos) |
| RESERVA | Bloqueio de vaga por 15, 30 ou 45 minutos |
| ESTATISTICA_POSTO_DIA | Indicadores do painel do dono |

## Cardinalidades (resumo)

- Um posto tem vários plugues e um plugue existe em vários postos (N:N).
- Um usuário avalia vários postos e um posto recebe várias avaliações (1:N dos dois lados, com a avaliação como entidade).
- Favoritos, alertas de liberação e resgates de cupom são relações N:N entre usuário e posto (ou cupom).
- Um posto pode ter no máximo um dono, e um dono pode ter vários postos.
