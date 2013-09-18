require 'spec_helper'

describe ChartLegendsController do
  render_views

  context "#create" do
    it "should redirect to patterns path if save succeeds"
    it "should redirect to new_pattern_chart_legend if save fails"
  end
end