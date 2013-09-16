# PDF default settings
pdf.default_leading 7
pdf.font_size 11
pdf.line_width 0.25
pdf.fill_color "666666"

# Font variables
normaly = Rails.root.join('app/assets/fonts/merriweather/Merriweather-Regular.ttf')
boldy = Rails.root.join('app/assets/fonts/merriweather/Merriweather-Bold.ttf')
italicy = Rails.root.join('app/assets/fonts/merriweather/Merriweather-Italic.ttf')
bolditalicy = Rails.root.join('app/assets/fonts/merriweather/Merriweather-BoldItalic.ttf')

#
# => PATTERN PAGE ONE
#
pdf.bounding_box([0, 710], :width => 540, :height => pdf.bounds.height - 40) do

  #
  # => TITLE
  #
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text @pattern.name, :size => 24, :align => :center

  #
  # => DESIGNED BY
  #
  pdf.font(normaly)
  pdf.fill_color "666666"
  pdf.text "Designed by Liz Abinante", :size => 10, :align => :center
  pdf.move_down (5)

  #
  # => TITLE IMAGE
  #
  pdf.image open("#{@pattern.images.first.photo.path(:large)}")
  pdf.move_down(10)

  #
  # => YARN INFORMATION FOR IMAGE
  #
  pdf.font(italicy)
  pdf.text "Shown in: #{@pattern.yarn_info}", :size => 8, :align => :center

  #
  # => FREE PATTERN DISCLAIMER
  #
  if @pattern.free?
    pdf.font(bolditalicy)
    pdf.fill_color "ff0000"
    pdf.text "This pattern is free and available online only at www.feministy.com. Happy knitting, with love from Liz!", :align => :center, :size => 8
  end

  #
  # => PATTERN DESCRIPTION
  #
  pdf.move_down (10)
  pdf.font(normaly)
  pdf.fill_color "666666"
  pdf.text @pattern.description, :align => :justify, :size => 11

end

#
# => PATTERN PAGE TWO
#
pdf.start_new_page
pdf.bounding_box([0, 700], :width => 540, :height => pdf.bounds.height - 65) do

  #
  # => TITLE FOR BASIC INFORMATION TABLE
  #
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text "Basic Information", :size => 14, :align => :center

  #
  # => BASIC INFORMATION TABLE
  #
  pdf.font(normaly)
  pdf.font_size 10
  pdf.fill_color "666666"
  pdf.table [
            ["Gauge", @pattern.gauge],
            ["Needle(s)", @pattern.needle],
            ["Yarn required", @pattern.yarn],
            ["Notions", @pattern.notions],
            ["Finished sizes", @pattern.finished_sizes]
            ],
            :cell_style => { :padding => 5, :border_width => 0},
            :column_widths => [100, 440]

  pdf.move_down(20)

  #
  # => ABBREVIATIONS HEADER
  #
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text "Abbreviations", :size => 12, :align => :center

  #
  # => ABBREVIATIONS LEGEND
  #
  pdf.font(normaly)
  pdf.fill_color "666666"
  pdf.text render_legend(@pattern, 1, 20), :align => :center, :size => 9
  pdf.text render_legend(@pattern, 20, 50), :align => :center, :size => 9
  render_legend(@pattern, 50, 500).each { |l| pdf.text l, :align => :center, :size => 9 }

  #
  # => ACTUAL PATTERN INSTRUCTIONS
  #
  pdf.fill_color "333333"
  pdf.move_down(20)
  pdf.font(boldy)
  pdf.text "Instructions", :align => :center, :size => 18
  pdf.font(normaly)

  #
  # => PATTERN SECTIONS
  #
  pdf.font_size 10
  @pattern.sections.sort_by(&:id).each do |section|

    #
    # => SECTION TITLE
    #
    pdf.font(boldy)
    pdf.fill_color "333333"
    pdf.text section.title, :size => 12

    #
    # => SECTION DESCRIPTION
    #
    pdf.font(italicy)
    pdf.fill_color "888888"
    pdf.text section.description

    #
    # => PREP FOR PATTERN ROWS
    #
    pdf.font(normaly)
    pdf.fill_color "666666"
    rows = format_rows_for(section)

    #
    # => PATTERN ROWS IN A TABLE
    #
    pdf.table rows, :cell_style => {:padding => 3, :border_width => 0 },
            :column_widths => [100, 440]
    pdf.move_down 17
    pdf.font(italicy)
    pdf.fill_color "888888"
    pdf.text section.instructions
    pdf.move_down 10
  end

  pdf.font(normaly)

  #
  # => PATTERN CHARTS
  #
  if @pattern.charts.count > 0
    pdf.start_new_page
    pdf.font(boldy)
    pdf.fill_color "333333"
    pdf.text "Charted Instructions", :align => :center, :size => 18
    @pattern.charts.each do |img|
      pdf.text img.name, :align => :center, :size => 12
      pdf.image open("#{img.image.path(:large)}"), :position => :center
      pdf.move_down 10
    end
    pdf.font(normaly)
  end

  #
  # => LEGENDS FOR CHARTS
  #
  if @pattern.chart_legends.count > 0
    pdf.font(boldy)
    pdf.move_down 10
    pdf.fill_color "333333"
    pdf.text "Legend", :align => :center, :size => 14
    @pattern.chart_legends.each do |img|
      pdf.image open("#{img.image.path(:medium)}"), :position => :center
    end
    pdf.font(normaly)
  end

  #
  # => ADDITIONAL PATTERN IMAGES
  # => STARTS NEW PAGE
  #
  if @pattern.images.count > 1
    pdf.start_new_page
    pdf.font(boldy)
    pdf.fill_color "333333"
    pdf.text "Additional Images", :align => :center, :size => 18
    @pattern.images.each do |img|
      pdf.image open("#{img.photo.path(:medium)}"), :position => :center
      pdf.move_down 10
    end
    pdf.font(normaly)
  end
end

#
# => HEADER FOR PATTERN PAGES 2+
#
pdf.repeat(2..10) do
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top + 25], :width  => pdf.bounds.width do
    pdf.move_down(10)
    pdf.default_leading 1
    pdf.font_size 8
    pdf.fill_color "cbcbcb"
    pdf.text "#{@pattern.name}. Version #{@pattern.version}, #{version(@pattern.updated_at)}. Design and pattern by Liz Abinante, www.feministy.com", :align => :center
    pdf.move_down(5)
  end
end

#
# => FOOTER FOR ALL PATTERN PAGES
#
pdf.repeat :all do
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 30], :width  => pdf.bounds.width do
    pdf.move_down(5)
    pdf.default_leading 1
    pdf.font_size 8
    pdf.fill_color "cbcbcb"
    pdf.text "For non-commercial use only. You may not distribute or sell this pattern or items made using pattern.", :align => :center
    pdf.text "Pattern support is free. If you’ve found an error or have questions please visit http://feministy.zendesk.com", :align => :center
  end
end

#
# => PAGE NUMBERS FOR PAGES 2+
#
pdf.number_pages "page <page> of <total>",
  { :start_count_at => 2, :page_filter => lambda{ |pg| pg != 1 },
    :at => [0, 0], :align => :center, :size => 8, :color => "cbcbcb"}