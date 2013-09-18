require 'spec_helper'

describe UsersController do
  render_views

  context "#create" do
    it "should redirect to patterns path if save succeeds"
    it "should redirect to root if save fails"
  end
end