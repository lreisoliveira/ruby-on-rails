require 'rails_helper'

RSpec.describe "participantes/index", type: :view do
  before(:each) do
    assign(:participantes, [
      Participante.create!(
        :re => 1,
        :nome => "Nome"
      ),
      Participante.create!(
        :re => 1,
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of participantes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
