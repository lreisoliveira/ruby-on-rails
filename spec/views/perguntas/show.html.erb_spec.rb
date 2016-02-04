require 'rails_helper'

RSpec.describe "perguntas/show", type: :view do
  before(:each) do
    @pergunta = assign(:pergunta, Pergunta.create!(
      :descricao => "Descricao",
      :vigente => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
