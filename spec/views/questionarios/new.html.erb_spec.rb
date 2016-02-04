require 'rails_helper'

RSpec.describe "questionarios/new", type: :view do
  before(:each) do
    assign(:questionario, Questionario.new(
      :descricao => "MyString"
    ))
  end

  it "renders new questionario form" do
    render

    assert_select "form[action=?][method=?]", questionarios_path, "post" do

      assert_select "input#questionario_descricao[name=?]", "questionario[descricao]"
    end
  end
end
