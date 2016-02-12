Rails.application.routes.draw do
  # root :to => "admin#index"
  # post  "/" => "questionarios#listar"
  #
  # get  "admin" => "admin#index"
  # post "admin" => "admin#index"
  #
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
      resources :perguntas, only: [:index, :show] do
        resources :alternativas, only: [:index, :show] do
          resources :participantes, only: [:index, :show]
        end
      end
    end

    resources :perguntas, only: [:index, :show, :create, :update, :destroy] do
      resources :alternativas, only: [:index, :show] do
        resources :participantes, only: [:index, :show]
      end
    end

    resources :alternativas, only: [:index, :show, :create, :update, :destroy] do
      resources :participantes, only: [:index, :show]
    end

    resources :participantes, only: [:index, :show, :create, :update, :destroy]

    post  "/participantes/:participante_id/alternativa/:id"  => "participantes#gravar_resposta"
  end

  # resources :questionarios_respostas
  # resources :questionarios_participantes
  # resources :questionarios_perguntas
end