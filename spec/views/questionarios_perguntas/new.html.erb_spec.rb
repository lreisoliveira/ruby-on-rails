require 'rails_helper'

RSpec.describe "questionarios_perguntas/new", type: :view do
  before(:each) do
    assign(:questionario_pergunta, QuestionarioPergunta.new(
      :questionario => nil,
      :pergunta => nil
    ))
  end

  it "renders new questionario_pergunta form" do
    render

    assert_select "form[action=?][method=?]", questionarios_perguntas_path, "post" do

      assert_select "input#questionario_pergunta_questionario_id[name=?]", "questionario_pergunta[questionario_id]"

      assert_select "input#questionario_pergunta_pergunta_id[name=?]", "questionario_pergunta[pergunta_id]"
    end
  end
end
