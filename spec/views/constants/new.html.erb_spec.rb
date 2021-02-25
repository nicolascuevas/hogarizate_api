require 'rails_helper'

RSpec.describe "constants/new", type: :view do
  before(:each) do
    assign(:constant, Constant.new(
      :name => "MyString",
      :value => "9.99"
    ))
  end

  it "renders new constant form" do
    render

    assert_select "form[action=?][method=?]", constants_path, "post" do

      assert_select "input[name=?]", "constant[name]"

      assert_select "input[name=?]", "constant[value]"
    end
  end
end
