# PDF default settings
pdf.default_leading 7
pdf.font_size 11
pdf.line_width 0.25
pdf.fill_color "666666"

# Font variables
normaly = Rails.root.join('app/assets/fonts/arvo/Arvo-Regular.ttf')
boldy = Rails.root.join('app/assets/fonts/arvo/Arvo-Bold.ttf')
italicy = Rails.root.join('app/assets/fonts/arvo/Arvo-Italic.ttf')

# Actual PDF generation
pdf.bounding_box([0, 710], :width => 540, :height => pdf.bounds.height - 65) do
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text @pattern.name, :size => 24, :align => :center

  pdf.font(normaly)
  pdf.fill_color "666666"
  pdf.text "Designed by Liz Abinante", :size => 10, :align => :center
  pdf.move_down (10)
  pdf.image open("#{@pattern.images.first.photo.path(:large)}")
  pdf.move_down(10)
  pdf.font(italicy)
  pdf.text "Shown in: #{@pattern.yarn_info}", :size => 8, :align => :center
  pdf.move_down (20)
  pdf.font(normaly)
  pdf.text @pattern.description, :align => :justify, :size => 12

end

pdf.start_new_page

pdf.bounding_box([0, 700], :width => 540, :height => pdf.bounds.height - 65) do
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text "Basic Information", :size => 14, :align => :center
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
  short_legend = []
  long_legend = []
  boom_legend = []
  @pattern.abbreviations.each do |a|
    if a.definition.length > 50
      legend = boom_legend
    elsif a.definition.length > 20
      legend = long_legend
    else
      legend = short_legend
    end
    legend << "#{a.stitch}:   #{a.definition}"
  end
  pdf.font(boldy)
  pdf.fill_color "333333"
  pdf.text "Abbreviations", :size => 12, :align => :center
  pdf.font(normaly)
  pdf.fill_color "666666"
  pdf.text short_legend.join("     ||     "), :align => :center, :size => 9
  pdf.text long_legend.join("     ||     "), :align => :center, :size => 9
  boom_legend.each { |l| pdf.text l, :align => :center, :size => 9 }

  pdf.fill_color "333333"
  pdf.move_down(20)
  pdf.font(boldy)
  pdf.text "Instructions", :align => :center, :size => 18
  pdf.font(normaly)

  pdf.font_size 10
  @pattern.sections.sort_by(&:id).each do |section|
    pdf.font(boldy)
    pdf.fill_color "333333"
    pdf.text section.title, :size => 12
    pdf.font(italicy)
    pdf.fill_color "888888"
    pdf.text section.description
    pdf.font(normaly)
    pdf.fill_color "666666"
    rows = section.rows.sort_by(&:id).map { |row| ["Row #{row.num}:", row.instructions] }
    pdf.table rows, :cell_style => {:padding => 5, :border_width => 0 },
            :column_widths => [100, 440]
    pdf.move_down 17
    pdf.font(italicy)
    pdf.fill_color "888888"
    pdf.text section.instructions
    pdf.move_down 10
  end

  pdf.font(normaly)
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

# Header
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

# Footer
pdf.repeat :all do
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
    pdf.move_down(5)
    pdf.default_leading 1
    pdf.font_size 8
    pdf.fill_color "cbcbcb"
    pdf.text "For non-commercial use only. You may not distribute or sell this pattern or items made using pattern."
    pdf.text "Pattern support is free. If you’ve found an error or have questions please visit http://feministy.zendesk.com"
  end
end

pdf.number_pages "<page> of <total>",
  { :start_count_at => 2, :page_filter => lambda{ |pg| pg != 1 },
    :at => [-50, 0], :align => :right, :size => 8, :color => "cbcbcb"}