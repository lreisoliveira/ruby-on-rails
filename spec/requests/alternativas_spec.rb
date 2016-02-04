require 'rails_helper'

RSpec.describe "Alternativas", type: :request do
  describe "GET /alternativas" do
    it "works! (now write some real specs)" do
      get alternativas_path
      expect(response).to have_http_status(200)
    end
  end
end
