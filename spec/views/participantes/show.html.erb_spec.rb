require 'rails_helper'

RSpec.describe "participantes/show", type: :view do
  before(:each) do
    @participante = assign(:participante, Participante.create!(
      :re => 1,
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Nome/)
  end
end
