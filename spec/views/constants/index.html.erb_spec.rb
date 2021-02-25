require 'rails_helper'

RSpec.describe "constants/index", type: :view do
  before(:each) do
    assign(:constants, [
      Constant.create!(
        :name => "Name",
        :value => "9.99"
      ),
      Constant.create!(
        :name => "Name",
        :value => "9.99"
      )
    ])
  end

  it "renders a list of constants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
