require 'rails_helper'

RSpec.describe "QuestionarioParticipantes", type: :request do
  describe "GET /questionarios_participantes" do
    it "works! (now write some real specs)" do
      get questionarios_participantes_path
      expect(response).to have_http_status(200)
    end
  end
end
