require 'rails_helper'

RSpec.describe "Communes", type: :request do
  describe "GET /communes" do
    it "works! (now write some real specs)" do
      get communes_path
      expect(response).to have_http_status(200)
    end
  end
end
