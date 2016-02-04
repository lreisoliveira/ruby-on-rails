require 'rails_helper'

RSpec.describe "questionarios_respostas/index", type: :view do
  before(:each) do
    assign(:questionarios_respostas, [
      QuestionarioResposta.create!(
        :questionario => nil,
        :participante => nil,
        :pergunta => nil,
        :alternativa => nil
      ),
      QuestionarioResposta.create!(
        :questionario => nil,
        :participante => nil,
        :pergunta => nil,
        :alternativa => nil
      )
    ])
  end

  it "renders a list of questionarios_respostas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
