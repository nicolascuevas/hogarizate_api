require "rails_helper"

RSpec.describe CommunesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/communes").to route_to("communes#index")
    end

    it "routes to #new" do
      expect(:get => "/communes/new").to route_to("communes#new")
    end

    it "routes to #show" do
      expect(:get => "/communes/1").to route_to("communes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/communes/1/edit").to route_to("communes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/communes").to route_to("communes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/communes/1").to route_to("communes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/communes/1").to route_to("communes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/communes/1").to route_to("communes#destroy", :id => "1")
    end
  end
end
