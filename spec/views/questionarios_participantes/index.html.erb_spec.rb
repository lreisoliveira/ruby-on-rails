require 'rails_helper'

RSpec.describe "questionarios_participantes/index", type: :view do
  before(:each) do
    assign(:questionarios_participantes, [
      QuestionarioParticipante.create!(
        :questionario => nil,
        :participante => nil,
        :pontuacao => 1
      ),
      QuestionarioParticipante.create!(
        :questionario => nil,
        :participante => nil,
        :pontuacao => 1
      )
    ])
  end

  it "renders a list of questionarios_participantes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
