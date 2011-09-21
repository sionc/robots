require 'spec_helper'

describe "robots/show.html.erb" do
  before(:each) do
    @robot = assign(:robot, stub_model(Robot,
      :name => "Name",
      :model => "Model",
      :description => "Description",
      :hardware => "Hardware",
      :software => "Software",
      :applications => "Applications"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Model/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hardware/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Software/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Applications/)
  end
end
