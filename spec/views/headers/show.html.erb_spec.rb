require 'spec_helper'

describe "headers/show" do
  before(:each) do
    @header = assign(:header, stub_model(Header,
      :title => "Title",
      :show_in_nav => false,
      := => "="
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/false/)
    rendered.should match(/=/)
  end
end
