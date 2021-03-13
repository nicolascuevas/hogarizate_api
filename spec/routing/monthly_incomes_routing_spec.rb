require "rails_helper"

RSpec.describe MonthlyIncomesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/monthly_incomes").to route_to("monthly_incomes#index")
    end

    it "routes to #new" do
      expect(:get => "/monthly_incomes/new").to route_to("monthly_incomes#new")
    end

    it "routes to #show" do
      expect(:get => "/monthly_incomes/1").to route_to("monthly_incomes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/monthly_incomes/1/edit").to route_to("monthly_incomes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/monthly_incomes").to route_to("monthly_incomes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/monthly_incomes/1").to route_to("monthly_incomes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/monthly_incomes/1").to route_to("monthly_incomes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/monthly_incomes/1").to route_to("monthly_incomes#destroy", :id => "1")
    end
  end
end
