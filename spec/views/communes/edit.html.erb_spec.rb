require 'rails_helper'

RSpec.describe "communes/edit", type: :view do
  before(:each) do
    @commune = assign(:commune, Commune.create!(
      :name => "MyString",
      :gain_value => "9.99"
    ))
  end

  it "renders the edit commune form" do
    render

    assert_select "form[action=?][method=?]", commune_path(@commune), "post" do

      assert_select "input[name=?]", "commune[name]"

      assert_select "input[name=?]", "commune[gain_value]"
    end
  end
end
