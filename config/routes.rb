Rails.application.routes.draw do
  # root :to => "admin#index"
  # post  "/" => "questionarios#listar"
  #
  # get  "admin" => "admin#index"
  # post "admin" => "admin#index"
  #
  # get "logout"  => "admin#logout"

  # get "v1.0/questionarios/"                      => "v10#show"
  # get "v1.0/questionarios/:id"                   => "v10#show"
  # get "v1.0/questionarios/:id/perguntas"         => "v10#perguntas"
  # get "v1.0/questionarios/:id/perguntas/:id_pergunta"  => "v10#perguntas"

  # get "questionarios/:id/perguntas"              => "questionarios_perguntas#index"
  # get "questionarios/:id/perguntas/adicionar"    => "questionarios_perguntas#new"
  # get "questionarios/:id/responder"              => "questionarios#responder"
  # post "questionarios/:id/responder"             => "questionarios#responder"
  # get "questionarios/:id/responder/:pergunta_id" => "questionarios#responder"

  # get "ranking/" => "relatorios#ranking"
  # get "ranking/geral" => "relatorios#ranking_geral"
  # get "ranking/:id" => "relatorios#ranking_questionario"
  #
  scope '/:v1.0' do
    root :to => "questionarios#index"
    resources :questionarios, only: [:index, :show, :create, :update, :destroy] do
      resources :perguntas, only: [:index, :show, :create] do
        resources :alternativas, only: [:index, :show]
      end
    end
    resources :perguntas, only: [:index, :show, :create, :update, :destroy]
  end

  # resources :questionarios_respostas
  # resources :questionarios_participantes
  # resources :participantes
  # resources :questionarios_perguntas
  # resources :alternativas
  # resources :perguntas
  # resources :questionarios
end