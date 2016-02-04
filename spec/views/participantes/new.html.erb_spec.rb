require 'rails_helper'

RSpec.describe "participantes/new", type: :view do
  before(:each) do
    assign(:participante, Participante.new(
      :re => 1,
      :nome => "MyString"
    ))
  end

  it "renders new participante form" do
    render

    assert_select "form[action=?][method=?]", participantes_path, "post" do

      assert_select "input#participante_re[name=?]", "participante[re]"

      assert_select "input#participante_nome[name=?]", "participante[nome]"
    end
  end
end
