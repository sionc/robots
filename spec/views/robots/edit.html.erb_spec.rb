require 'spec_helper'

describe "robots/edit.html.erb" do
  before(:each) do
    @robot = assign(:robot, stub_model(Robot,
      :name => "MyString",
      :model => "MyString",
      :description => "MyString",
      :hardware => "MyString",
      :software => "MyString",
      :applications => "MyString"
    ))
  end

  it "renders the edit robot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => robots_path(@robot), :method => "post" do
      assert_select "input#robot_name", :name => "robot[name]"
      assert_select "input#robot_model", :name => "robot[model]"
      assert_select "input#robot_description", :name => "robot[description]"
      assert_select "input#robot_hardware", :name => "robot[hardware]"
      assert_select "input#robot_software", :name => "robot[software]"
      assert_select "input#robot_applications", :name => "robot[applications]"
    end
  end
end
