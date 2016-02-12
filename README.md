# Overview

- Esta API possibilita criar questionários, perguntas e alternativas, criar participantes e suas respectivas resposta.

## Instalação
#### Clone
    git clone https://github.com/lreisoliveira/ruby-on-rails-questionario-api.git

#### Configuração
##### Executar a partir do diretório raiz do projeto
```
$ ./install.sh
```

# API

- Atualmente a versão do projeto é a v1.0

#### Principais recursos

##### Listar todos questionários
```
/v1.0/questionarios/ GET
```

##### Listar questionário específico
```
/v1.0/questionarios/[:id] GET
```

##### Listar as perguntas de um questionário
```
/v1.0/questionarios/[:id]/perguntas/ GET
```

##### Listar uma pergunta específica 
```
/v1.0/questionarios/[:id_questionario]/perguntas/[:id] GET
```

##### Listar as alternativas do questionário
```
/v1.0/questionarios/[:id_questionario]/perguntas/[:id_pergunta]/alternativas GET
```

##### Listar uma alternativa específica
```
/v1.0/questionarios/[:id_questionario]/perguntas/[:id_questionario]/alternativas/[:id] GET
```

##### Cadastrar questionário
```
/v1.0/questionarios/ POST
```

  Parâmetros:
  
- nome (string)  
- vigencia_inicio (date dd/mm/yyyy)
- vigencia_fim (date dd/mm/yyyy)

##### Cadastrar pergunta
```
/v1.0/perguntas/ POST
```

  Parâmetros:

- questionario_id (integer)  
- descricao (string)
- video (string)
- vigente (boolean)

##### Cadastrar alternativas
```
/v1.0/alternativas/ POST
```

  Parâmetros:
- pergunta_id (integer)  
- descricao (string)
- correto (boolean)

##### Cadastrar participante
```
/v1.0/participantes/ POST
```
  Parâmetros:
  
- re (integer)
- nome (string)  

##### Cadastrar alternativa respondida pelo participante
```
/v1.0/participantes/[:participante_id]/alternativa/[:id]
```