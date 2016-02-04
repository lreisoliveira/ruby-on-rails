require "rails_helper"

RSpec.describe QuestionariosPerguntasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questionarios_perguntas").to route_to("questionarios_perguntas#index")
    end

    it "routes to #new" do
      expect(:get => "/questionarios_perguntas/new").to route_to("questionarios_perguntas#new")
    end

    it "routes to #show" do
      expect(:get => "/questionarios_perguntas/1").to route_to("questionarios_perguntas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questionarios_perguntas/1/edit").to route_to("questionarios_perguntas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questionarios_perguntas").to route_to("questionarios_perguntas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/questionarios_perguntas/1").to route_to("questionarios_perguntas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/questionarios_perguntas/1").to route_to("questionarios_perguntas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questionarios_perguntas/1").to route_to("questionarios_perguntas#destroy", :id => "1")
    end

  end
end
