module PdfViewHelper
  def version(time)
    time.strftime("%B %Y")
  end

  def format_rows_for(section)
    section.rows.sort_by(&:id).map { |row| ["Row #{row.num}:", row.instructions] }
  end

  def render_legend(pattern, min, max)
    list = sort_legend_by_size(pattern.abbreviations, min, max)
    abbrevs = format_legend(list)

    return abbrevs if min == 50
    return format_short_legend(abbrevs) if max <= 50
  end

  def sort_legend_by_size(abbreviations, min, max)
    abbreviations.select do |a|
      a.definition.length > min && a.definition.length < max
    end
  end

  def format_legend(abbreviations)
    abbreviations.map { |a| "#{a.stitch}:   #{a.definition}" }
  end

  def format_short_legend(pretty_list)
    pretty_list.join("     ||     ")
  end
end