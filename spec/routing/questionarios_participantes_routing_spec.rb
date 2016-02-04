require "rails_helper"

RSpec.describe QuestionariosParticipantesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/questionarios_participantes").to route_to("questionarios_participantes#index")
    end

    it "routes to #new" do
      expect(:get => "/questionarios_participantes/new").to route_to("questionarios_participantes#new")
    end

    it "routes to #show" do
      expect(:get => "/questionarios_participantes/1").to route_to("questionarios_participantes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/questionarios_participantes/1/edit").to route_to("questionarios_participantes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/questionarios_participantes").to route_to("questionarios_participantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/questionarios_participantes/1").to route_to("questionarios_participantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/questionarios_participantes/1").to route_to("questionarios_participantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/questionarios_participantes/1").to route_to("questionarios_participantes#destroy", :id => "1")
    end

  end
end
