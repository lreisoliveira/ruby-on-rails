require 'rails_helper'

RSpec.describe "questionarios_perguntas/index", type: :view do
  before(:each) do
    assign(:questionarios_perguntas, [
      QuestionarioPergunta.create!(
        :questionario => nil,
        :pergunta => nil
      ),
      QuestionarioPergunta.create!(
        :questionario => nil,
        :pergunta => nil
      )
    ])
  end

  it "renders a list of questionarios_perguntas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
