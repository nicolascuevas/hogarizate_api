require 'rails_helper'

RSpec.describe "monthly_incomes/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
