module PdfViewHelper
  def version(time)
    time.strftime("%B %Y")
  end

  def format_rows_for(section)
    section.rows.sort_by(&:id).map { |row| ["Row #{row.num}:", row.instructions] }
  end

  def make_legend(pattern, min, max)
    list = prettify_legend(pattern.abbreviations, min, max)
    return list if min == 50
    return format_short_legend(list) if max <= 50
  end

  def prettify_legend(abbreviations, min, max)
    list = []
    abbreviations.each do |a|
      if a.definition.length > min && a.definition.length < max
        list << "#{a.stitch}:   #{a.definition}"
      end
    end
    list
  end

  def format_short_legend(list)
    list.join("     ||     ")
  end
end