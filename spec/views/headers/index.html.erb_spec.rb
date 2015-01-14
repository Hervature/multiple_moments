require 'spec_helper'

describe "headers/index" do
  before(:each) do
    assign(:headers, [
      stub_model(Header,
        :title => "Title",
        :show_in_nav => false,
        := => "="
      ),
      stub_model(Header,
        :title => "Title",
        :show_in_nav => false,
        := => "="
      )
    ])
  end

  it "renders a list of headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "=".to_s, :count => 2
  end
end
