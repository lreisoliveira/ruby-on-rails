require 'rails_helper'

RSpec.describe "perguntas/edit", type: :view do
  before(:each) do
    @pergunta = assign(:pergunta, Pergunta.create!(
      :descricao => "MyString",
      :vigente => false
    ))
  end

  it "renders the edit pergunta form" do
    render

    assert_select "form[action=?][method=?]", pergunta_path(@pergunta), "post" do

      assert_select "input#pergunta_descricao[name=?]", "pergunta[descricao]"

      assert_select "input#pergunta_vigente[name=?]", "pergunta[vigente]"
    end
  end
end
