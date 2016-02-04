require "rails_helper"

RSpec.describe PerguntasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/perguntas").to route_to("perguntas#index")
    end

    it "routes to #new" do
      expect(:get => "/perguntas/new").to route_to("perguntas#new")
    end

    it "routes to #show" do
      expect(:get => "/perguntas/1").to route_to("perguntas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/perguntas/1/edit").to route_to("perguntas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/perguntas").to route_to("perguntas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/perguntas/1").to route_to("perguntas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/perguntas/1").to route_to("perguntas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/perguntas/1").to route_to("perguntas#destroy", :id => "1")
    end

  end
end
