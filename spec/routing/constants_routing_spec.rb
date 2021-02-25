require "rails_helper"

RSpec.describe ConstantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/constants").to route_to("constants#index")
    end

    it "routes to #new" do
      expect(:get => "/constants/new").to route_to("constants#new")
    end

    it "routes to #show" do
      expect(:get => "/constants/1").to route_to("constants#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/constants/1/edit").to route_to("constants#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/constants").to route_to("constants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/constants/1").to route_to("constants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/constants/1").to route_to("constants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/constants/1").to route_to("constants#destroy", :id => "1")
    end
  end
end
