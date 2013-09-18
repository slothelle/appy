require 'spec_helper'

describe ChartsController do
  render_views

  context "#create" do
    it "should redirect to patterns path if save succeeds"
    it "should redirect to new_pattern_chart if save fails"
  end
end