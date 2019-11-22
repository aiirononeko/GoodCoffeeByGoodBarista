require 'rails_helper'

RSpec.describe "owners/new", type: :view do
  before(:each) do
    assign(:owner, Owner.new(
      :company => "MyString",
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :title => "MyString",
      :about => "MyText",
      :introduce => "MyText",
      :wanted => "MyText"
    ))
  end

  it "renders new owner form" do
    render

    assert_select "form[action=?][method=?]", owners_path, "post" do

      assert_select "input[name=?]", "owner[company]"

      assert_select "input[name=?]", "owner[name]"

      assert_select "input[name=?]", "owner[email]"

      assert_select "input[name=?]", "owner[password_digest]"

      assert_select "input[name=?]", "owner[title]"

      assert_select "textarea[name=?]", "owner[about]"

      assert_select "textarea[name=?]", "owner[introduce]"

      assert_select "textarea[name=?]", "owner[wanted]"
    end
  end
end
