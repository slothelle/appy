module PatternViewHelper
  def pretty_time(time)
    time.strftime("%m/%d/%Y at %l:%M %P (%Z)")
  end

  def pattern_meets_pdf_requirements?(p)
    p.images? && p.abbrevs? && p.charts? && p.chart_legends?
  end
end