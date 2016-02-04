require 'rails_helper'

RSpec.describe "alternativas/edit", type: :view do
  before(:each) do
    @alternativa = assign(:alternativa, Alternativa.create!(
      :pergunta => nil,
      :descricao => "MyString",
      :correto => false
    ))
  end

  it "renders the edit alternativa form" do
    render

    assert_select "form[action=?][method=?]", alternativa_path(@alternativa), "post" do

      assert_select "input#alternativa_pergunta_id[name=?]", "alternativa[pergunta_id]"

      assert_select "input#alternativa_descricao[name=?]", "alternativa[descricao]"

      assert_select "input#alternativa_correto[name=?]", "alternativa[correto]"
    end
  end
end
