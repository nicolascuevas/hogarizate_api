require 'rails_helper'

RSpec.describe "Constants", type: :request do
  describe "GET /constants" do
    it "works! (now write some real specs)" do
      get constants_path
      expect(response).to have_http_status(200)
    end
  end
end
