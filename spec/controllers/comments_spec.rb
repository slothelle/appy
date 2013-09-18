require 'spec_helper'

describe CommentsController do
  render_views

  context "#create" do
    it "should redirect to pattern comments if save succeeds"
    it "should redirect to new pattern comment if save fails"
  end
end