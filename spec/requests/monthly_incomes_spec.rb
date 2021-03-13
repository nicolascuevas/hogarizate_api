require 'rails_helper'

RSpec.describe "MonthlyIncomes", type: :request do
  describe "GET /monthly_incomes" do
    it "works! (now write some real specs)" do
      get monthly_incomes_path
      expect(response).to have_http_status(200)
    end
  end
end
