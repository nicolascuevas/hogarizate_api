require 'rails_helper'

RSpec.describe "constants/edit", type: :view do
  before(:each) do
    @constant = assign(:constant, Constant.create!(
      :name => "MyString",
      :value => "9.99"
    ))
  end

  it "renders the edit constant form" do
    render

    assert_select "form[action=?][method=?]", constant_path(@constant), "post" do

      assert_select "input[name=?]", "constant[name]"

      assert_select "input[name=?]", "constant[value]"
    end
  end
end
