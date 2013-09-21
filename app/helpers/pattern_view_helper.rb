module PatternViewHelper
  STATES = ["published", "testing", "editing", "draft"]

  def pretty_time(time)
    time.strftime("%m/%d/%Y at %l:%M %P (%Z)")
  end

  def short_pretty_time(time)
    time.strftime("%m/%d/%Y")
  end

  def pattern_meets_pdf_requirements?(p)
    reqs = p.images? && p.abbrevs?
    if reqs && p.charts? && p.chart_legends?
      true
    elsif reqs && !p.charts? && !p.chart_legends?
      true
    else
      false
    end
  end
end