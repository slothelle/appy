class ChartsController < ApplicationController
  def new
    @chart = Chart.new
    @pattern = Pattern.find(params[:pattern_id])
    @charts = @pattern.charts
  end

  def create
    chart = Chart.new(params[:chart])
    chart.pattern = Pattern.find(params[:pattern_id])
    if chart.save
      flash[:notice] = "Chart #{chart.image_file_name} successfully added to #{chart.pattern.name}"
      redirect_to patterns_path
    else
      redirect_to new_pattern_chart_path(params[:pattern_id])
    end
  end

  def destroy
    Chart.destroy(params[:id])
  end
end