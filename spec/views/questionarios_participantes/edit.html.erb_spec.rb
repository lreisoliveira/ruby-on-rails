require 'rails_helper'

RSpec.describe "questionarios_participantes/edit", type: :view do
  before(:each) do
    @questionario_participante = assign(:questionario_participante, QuestionarioParticipante.create!(
      :questionario => nil,
      :participante => nil,
      :pontuacao => 1
    ))
  end

  it "renders the edit questionario_participante form" do
    render

    assert_select "form[action=?][method=?]", questionario_participante_path(@questionario_participante), "post" do

      assert_select "input#questionario_participante_questionario_id[name=?]", "questionario_participante[questionario_id]"

      assert_select "input#questionario_participante_participante_id[name=?]", "questionario_participante[participante_id]"

      assert_select "input#questionario_participante_pontuacao[name=?]", "questionario_participante[pontuacao]"
    end
  end
end
