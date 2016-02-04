require 'rails_helper'

RSpec.describe "Perguntas", type: :request do
  describe "GET /perguntas" do
    it "works! (now write some real specs)" do
      get perguntas_path
      expect(response).to have_http_status(200)
    end
  end
end
