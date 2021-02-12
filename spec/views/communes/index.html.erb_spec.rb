require 'rails_helper'

RSpec.describe "communes/index", type: :view do
  before(:each) do
    assign(:communes, [
      Commune.create!(
        :name => "Name",
        :gain_value => "9.99"
      ),
      Commune.create!(
        :name => "Name",
        :gain_value => "9.99"
      )
    ])
  end

  it "renders a list of communes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
