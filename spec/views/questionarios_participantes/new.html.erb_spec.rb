require 'rails_helper'

RSpec.describe "questionarios_participantes/new", type: :view do
  before(:each) do
    assign(:questionario_participante, QuestionarioParticipante.new(
      :questionario => nil,
      :participante => nil,
      :pontuacao => 1
    ))
  end

  it "renders new questionario_participante form" do
    render

    assert_select "form[action=?][method=?]", questionarios_participantes_path, "post" do

      assert_select "input#questionario_participante_questionario_id[name=?]", "questionario_participante[questionario_id]"

      assert_select "input#questionario_participante_participante_id[name=?]", "questionario_participante[participante_id]"

      assert_select "input#questionario_participante_pontuacao[name=?]", "questionario_participante[pontuacao]"
    end
  end
end
