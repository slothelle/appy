# PDF default settings
pdf.default_leading 7
pdf.font_size 11
pdf.line_width 0.25

# Font variables
normaly = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Regular.ttf')
boldy = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Bold.ttf')
italicy = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Italic.ttf')

# Actual PDF generation
pdf.font(boldy)
pdf.text @pattern.name, :size => 24, :align => :center

pdf.font(normaly)
pdf.text "Designed by Liz Abinante", :size => 10, :align => :center
pdf.stroke_horizontal_rule

pdf.move_down (10)
pdf.text @pattern.description, :align => :justify

pdf.move_down 20
pdf.font(boldy)
pdf.text "Basic Information", :size => 14, :align => :center
pdf.font(normaly)
pdf.table [
          ["Gauge", @pattern.gauge],
          ["Needle(s)", @pattern.needle],
          ["Yarn required", @pattern.yarn],
          ["Yarn shown", @pattern.yarn_info],
          ["Notions", @pattern.notions],
          ["Finished sizes", @pattern.finished_sizes]
        ],
        :cell_style => {:padding => 10, :border_width => 0.25},
        :column_widths => [100, 440]

pdf.move_down 20
pdf.start_new_page

@pattern.sections.each do |section|
  pdf.move_down 10
  pdf.font(boldy)
  pdf.text section.title, :align => :center, :size => 18
  pdf.font(normaly)
  pdf.text section.description
  section.rows.each do |row|
    side = "(#{row.side})" if row.side != ""
    pdf.text "Row #{row.num} #{side}: #{row.instructions}"
  end
end


# Header
pdf.repeat(2..10) do
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top + 25], :width  => pdf.bounds.width do
    pdf.move_down(10)
    pdf.default_leading 1
    pdf.font_size 8
    pdf.text "#{@pattern.name}. Version 1, January 2013. Design and pattern by Liz Abinante, www.feministy.com", :align => :center
    pdf.move_down(5)
    pdf.stroke_horizontal_rule
  end
end

# Footer
pdf.repeat :all do
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
    pdf.stroke_horizontal_rule
    pdf.move_down(5)
    # pdf.text "Design and pattern © Liz Abinante."
    pdf.default_leading 1
    pdf.font_size 8
    pdf.text "For non-commercial use only. You may not distribute or sell this pattern or items made using pattern."
    pdf.text "Pattern support is free. If you’ve found an error or have questions please visit http://feministy.zendesk.com"
  end
end

pdf.number_pages "<page> of <total>",
  { :start_count_at => 2, :page_filter => lambda{ |pg| pg != 1 },
    :at => [-50, 0], :align => :right, :size => 8}