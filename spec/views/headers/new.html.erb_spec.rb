require 'spec_helper'

describe "headers/new" do
  before(:each) do
    assign(:header, stub_model(Header,
      :title => "MyString",
      :show_in_nav => false,
      := => "MyString"
    ).as_new_record)
  end

  it "renders new header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", headers_path, "post" do
      assert_select "input#header_title[name=?]", "header[title]"
      assert_select "input#header_show_in_nav[name=?]", "header[show_in_nav]"
      assert_select "input#header_=[name=?]", "header[=]"
    end
  end
end
