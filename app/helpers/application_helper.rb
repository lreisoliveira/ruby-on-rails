module ApplicationHelper

  def autenticar_admin
    redirect_to  '/admin' if !session[:autenticado]
  end

  def autenticar_funcionario
    redirect_to  '/' if !session[:participante_re]
  end

end
