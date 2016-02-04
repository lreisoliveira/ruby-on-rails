require 'rails_helper'

RSpec.describe "perguntas/new", type: :view do
  before(:each) do
    assign(:pergunta, Pergunta.new(
      :descricao => "MyString",
      :vigente => false
    ))
  end

  it "renders new pergunta form" do
    render

    assert_select "form[action=?][method=?]", perguntas_path, "post" do

      assert_select "input#pergunta_descricao[name=?]", "pergunta[descricao]"

      assert_select "input#pergunta_vigente[name=?]", "pergunta[vigente]"
    end
  end
end
