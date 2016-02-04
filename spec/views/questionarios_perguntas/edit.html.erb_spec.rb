require 'rails_helper'

RSpec.describe "questionarios_perguntas/edit", type: :view do
  before(:each) do
    @questionario_pergunta = assign(:questionario_pergunta, QuestionarioPergunta.create!(
      :questionario => nil,
      :pergunta => nil
    ))
  end

  it "renders the edit questionario_pergunta form" do
    render

    assert_select "form[action=?][method=?]", questionario_pergunta_path(@questionario_pergunta), "post" do

      assert_select "input#questionario_pergunta_questionario_id[name=?]", "questionario_pergunta[questionario_id]"

      assert_select "input#questionario_pergunta_pergunta_id[name=?]", "questionario_pergunta[pergunta_id]"
    end
  end
end
