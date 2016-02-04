require 'rails_helper'

RSpec.describe "participantes/edit", type: :view do
  before(:each) do
    @participante = assign(:participante, Participante.create!(
      :re => 1,
      :nome => "MyString"
    ))
  end

  it "renders the edit participante form" do
    render

    assert_select "form[action=?][method=?]", participante_path(@participante), "post" do

      assert_select "input#participante_re[name=?]", "participante[re]"

      assert_select "input#participante_nome[name=?]", "participante[nome]"
    end
  end
end
