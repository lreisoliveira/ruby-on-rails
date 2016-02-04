#!/bin/bash

read -p "Deseja criar a estrutura do banco de dados e do projeto? Se o banco de dados já existir todos os dados serão apagados! <y/n> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then

  PROJECT_PATH=$(pwd)
  cp $PROJECT_PATH/config/config.yml.sample $PROJECT_PATH/config/config.yml
  cp $PROJECT_PATH/config/database.yml.sample $PROJECT_PATH/config/database.yml
  cd $PROJECT_PATH
  bundle install

  rake db:drop
  rake db:create

  # rails generate scaffold questionario nome:string vigencia_inicio:date vigencia_fim:date --skip views
  # rails generate scaffold pergunta descricao:string video:string vigente:boolean --skip views
  # rails generate scaffold alternativa pergunta:references descricao:string correto:boolean --skip views
  # rails generate scaffold questionario_pergunta questionario:references pergunta:references --skip views
  # rails generate scaffold participante re:integer nome:string --skip views
  # rails generate scaffold questionario_participante questionario:references participante:references --skip views
  # rails generate scaffold questionario_resposta questionario:references participante:references pergunta:references alternativa:references --skip views
  # rails g model Admin nome:string login:string senha:string vigente:boolean

  rake db:migrate
  rake db:seed
fi