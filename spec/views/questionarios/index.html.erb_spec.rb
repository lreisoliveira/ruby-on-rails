require 'rails_helper'

RSpec.describe "questionarios/index", type: :view do
  before(:each) do
    assign(:questionarios, [
      Questionario.create!(
        :descricao => "Descricao"
      ),
      Questionario.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of questionarios" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
