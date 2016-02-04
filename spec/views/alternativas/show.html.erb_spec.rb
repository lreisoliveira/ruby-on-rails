require 'rails_helper'

RSpec.describe "alternativas/show", type: :view do
  before(:each) do
    @alternativa = assign(:alternativa, Alternativa.create!(
      :pergunta => nil,
      :descricao => "Descricao",
      :correto => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
