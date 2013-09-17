module PatternViewHelper
  STATES = ["published", "testing", "editing", "draft", "errors"]

  def pretty_time(time)
    time.strftime("%m/%d/%Y at %l:%M %P (%Z)")
  end

  def short_pretty_time(time)
    time.strftime("%m/%d/%Y")
  end

  def pattern_meets_pdf_requirements?(p)
    p.images? && p.abbrevs? && p.charts? && p.chart_legends?
  end
end