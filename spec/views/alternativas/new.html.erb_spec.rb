require 'rails_helper'

RSpec.describe "alternativas/new", type: :view do
  before(:each) do
    assign(:alternativa, Alternativa.new(
      :pergunta => nil,
      :descricao => "MyString",
      :correto => false
    ))
  end

  it "renders new alternativa form" do
    render

    assert_select "form[action=?][method=?]", alternativas_path, "post" do

      assert_select "input#alternativa_pergunta_id[name=?]", "alternativa[pergunta_id]"

      assert_select "input#alternativa_descricao[name=?]", "alternativa[descricao]"

      assert_select "input#alternativa_correto[name=?]", "alternativa[correto]"
    end
  end
end
