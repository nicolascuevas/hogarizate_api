require 'rails_helper'

RSpec.describe "contact_forms/new", type: :view do
  before(:each) do
    assign(:contact_form, ContactForm.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new contact_form form" do
    render

    assert_select "form[action=?][method=?]", contact_forms_path, "post" do

      assert_select "input[name=?]", "contact_form[first_name]"

      assert_select "input[name=?]", "contact_form[last_name]"

      assert_select "input[name=?]", "contact_form[email]"

      assert_select "input[name=?]", "contact_form[phone]"
    end
  end
end
