require 'rails_helper'

RSpec.describe "perguntas/index", type: :view do
  before(:each) do
    assign(:perguntas, [
      Pergunta.create!(
        :descricao => "Descricao",
        :vigente => false
      ),
      Pergunta.create!(
        :descricao => "Descricao",
        :vigente => false
      )
    ])
  end

  it "renders a list of perguntas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
