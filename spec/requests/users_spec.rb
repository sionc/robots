# This class was adapted from the example in Ruby on Rails Tutorial by Michael Hartl which
# can be found at http://ruby.railstutorial.org/ruby-on-rails-tutorial-book.

require 'spec_helper'

describe "Users" do

  describe "signup" do
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit new_user_registration_path
          fill_in "Email",                  :with => ""
          fill_in "Password",               :with => ""
          fill_in "Password confirmation",  :with => ""
          click_button
        end.should_not change(User, :count)
      end
      describe "success" do
        it "should make a new user" do
          lambda do
            visit new_user_registration_path
            fill_in "Email",                  :with => "test@test.com"
            fill_in "Password",               :with => "testme"
            fill_in "Password confirmation",  :with => "testme"
            click_button
            response.should render_template('pages/home')
          end.should change(User, :count).by(1)
        end
      end
    end
  end
end
