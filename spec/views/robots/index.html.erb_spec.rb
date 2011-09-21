require 'spec_helper'

describe "robots/index.html.erb" do
  before(:each) do
    assign(:robots, [
      stub_model(Robot,
        :name => "Name",
        :model => "Model",
        :description => "Description",
        :hardware => "Hardware",
        :software => "Software",
        :applications => "Applications"
      ),
      stub_model(Robot,
        :name => "Name",
        :model => "Model",
        :description => "Description",
        :hardware => "Hardware",
        :software => "Software",
        :applications => "Applications"
      )
    ])
  end

  it "renders a list of robots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hardware".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Software".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Applications".to_s, :count => 2
  end
end
