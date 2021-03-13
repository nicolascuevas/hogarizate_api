require 'rails_helper'

RSpec.describe "monthly_incomes/index", type: :view do
  before(:each) do
    assign(:monthly_incomes, [
      MonthlyIncome.create!(
        :contact_form => nil,
        :year => "",
        :month => "",
        :total => "",
        :main => "",
        :extra => ""
      ),
      MonthlyIncome.create!(
        :contact_form => nil,
        :year => "",
        :month => "",
        :total => "",
        :main => "",
        :extra => ""
      )
    ])
  end

  it "renders a list of monthly_incomes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
