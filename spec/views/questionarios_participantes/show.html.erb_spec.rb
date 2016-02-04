require 'rails_helper'

RSpec.describe "questionarios_participantes/show", type: :view do
  before(:each) do
    @questionario_participante = assign(:questionario_participante, QuestionarioParticipante.create!(
      :questionario => nil,
      :participante => nil,
      :pontuacao => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
