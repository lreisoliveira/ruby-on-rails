require 'rails_helper'

RSpec.describe "questionarios_respostas/show", type: :view do
  before(:each) do
    @questionario_resposta = assign(:questionario_resposta, QuestionarioResposta.create!(
      :questionario => nil,
      :participante => nil,
      :pergunta => nil,
      :alternativa => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
