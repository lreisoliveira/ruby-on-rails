require 'rails_helper'

RSpec.describe "QuestionarioPerguntas", type: :request do
  describe "GET /questionarios_perguntas" do
    it "works! (now write some real specs)" do
      get questionarios_perguntas_path
      expect(response).to have_http_status(200)
    end
  end
end
