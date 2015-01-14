require 'spec_helper'

describe "headers/edit" do
  before(:each) do
    @header = assign(:header, stub_model(Header,
      :title => "MyString",
      :show_in_nav => false,
      := => "MyString"
    ))
  end

  it "renders the edit header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", header_path(@header), "post" do
      assert_select "input#header_title[name=?]", "header[title]"
      assert_select "input#header_show_in_nav[name=?]", "header[show_in_nav]"
      assert_select "input#header_=[name=?]", "header[=]"
    end
  end
end
