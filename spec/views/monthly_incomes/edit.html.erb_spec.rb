require 'rails_helper'

RSpec.describe "monthly_incomes/edit", type: :view do
  before(:each) do
    @monthly_income = assign(:monthly_income, MonthlyIncome.create!(
      :contact_form => nil,
      :year => "",
      :month => "",
      :total => "",
      :main => "",
      :extra => ""
    ))
  end

  it "renders the edit monthly_income form" do
    render

    assert_select "form[action=?][method=?]", monthly_income_path(@monthly_income), "post" do

      assert_select "input[name=?]", "monthly_income[contact_form_id]"

      assert_select "input[name=?]", "monthly_income[year]"

      assert_select "input[name=?]", "monthly_income[month]"

      assert_select "input[name=?]", "monthly_income[total]"

      assert_select "input[name=?]", "monthly_income[main]"

      assert_select "input[name=?]", "monthly_income[extra]"
    end
  end
end
