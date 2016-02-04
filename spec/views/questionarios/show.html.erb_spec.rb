require 'rails_helper'

RSpec.describe "questionarios/show", type: :view do
  before(:each) do
    @questionario = assign(:questionario, Questionario.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
