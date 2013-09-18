require 'spec_helper'

describe SessionsController do
  render_views

  context "#create" do
    it "should redirect to patterns path if user is authenticated"
    it "should redirect to new_user if user doesn't exist"
    it "should redirect to new_user if password is incorrect"
  end
end