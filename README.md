# Overview

- Fornecer através de API, criar e consultar questionários

## Instalação
#### Clone do projeto
    git clone https://github.com/lreisoliveira/ruby-on-rails-questionario-api.git

## Configuração do projeto
##### Executar a partir do diretório raiz do projeto
```
$ ./install.sh
```

- Executar na linha de comando, a partir da raiz do projeto para criar a base de dados:
    $ ./install.sh

## API
##### GET
##### Listar todos os questionários

/v1.0/questionarios/

##### Listar um questionário específico

/v1.0/questionarios/[:id]

##### Listar as perguntas de um questionário

/v1.0/questionarios/[:id]/perguntas/

##### Listar uma pergunta específica

/v1.0/questionarios/[:id_questionario]/perguntas/[:id]

##### Listar as alternativas do questionário

/v1.0/questionarios/[:id_questionario]/perguntas/[:id_pergunta]/alternativas

##### Listar uma alternativa específica

/v1.0/questionarios/[:id_questionario]/perguntas/[:id_questionario]/alternativas/[:id]

##### POST

/v1.0/questionarios/

  Parâmetros:

  nome string
  vigencia_inicio date dd/mm/yyyy
  vigencia_fim date dd/mm/yyyy


##### PUT

/v1.0/questionarios/:id

  Parâmetros:

  nome string
  vigencia_inicio date dd/mm/yyyy
  vigencia_fim date dd/mm/yyyy


##### DELETE

/v1.0/questionarios/:id