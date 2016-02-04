require 'rails_helper'

RSpec.describe "QuestionarioResposta", type: :request do
  describe "GET /questionarios_respostas" do
    it "works! (now write some real specs)" do
      get questionarios_respostas_path
      expect(response).to have_http_status(200)
    end
  end
end
