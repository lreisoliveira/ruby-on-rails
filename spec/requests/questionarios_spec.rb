require 'rails_helper'

RSpec.describe "Questionarios", type: :request do
  describe "GET /questionarios" do
    it "works! (now write some real specs)" do
      get questionarios_path
      expect(response).to have_http_status(200)
    end
  end
end
