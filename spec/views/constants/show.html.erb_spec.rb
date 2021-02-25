require 'rails_helper'

RSpec.describe "constants/show", type: :view do
  before(:each) do
    @constant = assign(:constant, Constant.create!(
      :name => "Name",
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
