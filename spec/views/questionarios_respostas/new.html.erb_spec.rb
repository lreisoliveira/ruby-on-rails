require 'rails_helper'

RSpec.describe "questionarios_respostas/new", type: :view do
  before(:each) do
    assign(:questionario_resposta, QuestionarioResposta.new(
      :questionario => nil,
      :participante => nil,
      :pergunta => nil,
      :alternativa => nil
    ))
  end

  it "renders new questionario_resposta form" do
    render

    assert_select "form[action=?][method=?]", questionarios_respostas_path, "post" do

      assert_select "input#questionario_resposta_questionario_id[name=?]", "questionario_resposta[questionario_id]"

      assert_select "input#questionario_resposta_participante_id[name=?]", "questionario_resposta[participante_id]"

      assert_select "input#questionario_resposta_pergunta_id[name=?]", "questionario_resposta[pergunta_id]"

      assert_select "input#questionario_resposta_alternativa_id[name=?]", "questionario_resposta[alternativa_id]"
    end
  end
end
