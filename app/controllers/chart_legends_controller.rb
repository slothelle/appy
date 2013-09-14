class ChartLegendsController < ApplicationController
  def new
    @legend = ChartLegend.new
    @pattern = Pattern.find(params[:pattern_id])
    @legends = @pattern.chart_legends
  end

  def create
    legend = ChartLegend.new(params[:chart_legend])
    legend.pattern = Pattern.find(params[:pattern_id])
    if legend.save!
      flash[:notice] = "Legend #{legend.image_file_name} successfully added to #{legend.pattern.name}"
      redirect_to patterns_path
    else
      redirect_to new_pattern_chart_legend_path(params[:pattern_id])
    end
  end

  def destroy
    ChartLegend.destroy(params[:id])
  end

  def destroy
    # more magic
  end
end