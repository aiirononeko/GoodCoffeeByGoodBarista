require 'rails_helper'

RSpec.describe "owners/index", type: :view do
  before(:each) do
    assign(:owners, [
      Owner.create!(
        :company => "Company",
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :title => "Title",
        :about => "MyText",
        :introduce => "MyText",
        :wanted => "MyText"
      ),
      Owner.create!(
        :company => "Company",
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :title => "Title",
        :about => "MyText",
        :introduce => "MyText",
        :wanted => "MyText"
      )
    ])
  end

  it "renders a list of owners" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
