require 'rails_helper'

RSpec.describe "questionarios/edit", type: :view do
  before(:each) do
    @questionario = assign(:questionario, Questionario.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit questionario form" do
    render

    assert_select "form[action=?][method=?]", questionario_path(@questionario), "post" do

      assert_select "input#questionario_descricao[name=?]", "questionario[descricao]"
    end
  end
end
