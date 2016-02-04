  class AdminController < ApplicationController

    include ApplicationHelper

    def index
      if !params[:login].nil?
        autenticado = Admin.where(login: params[:login], senha: Digest::MD5.hexdigest(params[:senha])).first
        unless autenticado.nil?
          session[:autenticado] = true
          session[:nome] = autenticado.nome
          redirect_to '/admin'
        end
        @mensagem = 'Login ou senha inválidos' if @nome.nil?
      end
    end

    def logout
      reset_session
      autenticar_admin
    end
  end