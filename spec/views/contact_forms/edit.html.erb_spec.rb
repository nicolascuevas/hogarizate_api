require 'rails_helper'

RSpec.describe "contact_forms/edit", type: :view do
  before(:each) do
    @contact_form = assign(:contact_form, ContactForm.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit contact_form form" do
    render

    assert_select "form[action=?][method=?]", contact_form_path(@contact_form), "post" do

      assert_select "input[name=?]", "contact_form[first_name]"

      assert_select "input[name=?]", "contact_form[last_name]"

      assert_select "input[name=?]", "contact_form[email]"

      assert_select "input[name=?]", "contact_form[phone]"
    end
  end
end
