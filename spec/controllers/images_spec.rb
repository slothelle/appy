require 'spec_helper'

describe ImagesController do
  render_views

  context "#create" do
    it "should redirect to patterns path if save succeeds"
    it "should redirect to new_pattern_image if save fails"
  end
end