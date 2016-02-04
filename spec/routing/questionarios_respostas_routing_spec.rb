require "rails_helper"

RSpec.describe QuestionariosRespostasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questionarios_respostas").to route_to("questionarios_respostas#index")
    end

    it "routes to #new" do
      expect(:get => "/questionarios_respostas/new").to route_to("questionarios_respostas#new")
    end

    it "routes to #show" do
      expect(:get => "/questionarios_respostas/1").to route_to("questionarios_respostas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questionarios_respostas/1/edit").to route_to("questionarios_respostas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questionarios_respostas").to route_to("questionarios_respostas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/questionarios_respostas/1").to route_to("questionarios_respostas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/questionarios_respostas/1").to route_to("questionarios_respostas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questionarios_respostas/1").to route_to("questionarios_respostas#destroy", :id => "1")
    end

  end
end
