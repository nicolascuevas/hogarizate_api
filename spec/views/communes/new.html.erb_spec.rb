require 'rails_helper'

RSpec.describe "communes/new", type: :view do
  before(:each) do
    assign(:commune, Commune.new(
      :name => "MyString",
      :gain_value => "9.99"
    ))
  end

  it "renders new commune form" do
    render

    assert_select "form[action=?][method=?]", communes_path, "post" do

      assert_select "input[name=?]", "commune[name]"

      assert_select "input[name=?]", "commune[gain_value]"
    end
  end
end
