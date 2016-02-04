require 'rails_helper'

RSpec.describe "questionarios_perguntas/show", type: :view do
  before(:each) do
    @questionario_pergunta = assign(:questionario_pergunta, QuestionarioPergunta.create!(
      :questionario => nil,
      :pergunta => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
