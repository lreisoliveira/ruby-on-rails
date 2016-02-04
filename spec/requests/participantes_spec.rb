require 'rails_helper'

RSpec.describe "Participantes", type: :request do
  describe "GET /participantes" do
    it "works! (now write some real specs)" do
      get participantes_path
      expect(response).to have_http_status(200)
    end
  end
end
