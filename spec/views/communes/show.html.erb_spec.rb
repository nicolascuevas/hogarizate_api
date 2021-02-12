require 'rails_helper'

RSpec.describe "communes/show", type: :view do
  before(:each) do
    @commune = assign(:commune, Commune.create!(
      :name => "Name",
      :gain_value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
