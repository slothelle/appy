# PDF default settings
pdf.default_leading 7
pdf.font_size 11
pdf.line_width 0.25

# Font variables
normaly = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Regular.ttf')
boldy = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Bold.ttf')
italicy = Rails.root.join('app/assets/fonts/source_sans_pro/SourceSansPro-Italic.ttf')

# Actual PDF generation
pdf.bounding_box([0, 700], :width => 540, :height => pdf.bounds.height - 65) do
  pdf.image open(Image.find(11).photo.path), :position => :center
  pdf.image open(Image.find(12).photo.path(:thumb)), :position => :center
  pdf.font(boldy)
  pdf.text @pattern.name, :size => 24, :align => :center

  pdf.font(normaly)
  pdf.text "Designed by Liz Abinante", :size => 10, :align => :center
  pdf.stroke_horizontal_rule

  pdf.move_down (10)
  pdf.image open("#{@pattern.images.first.photo.path(:large)}")
  pdf.move_down (10)
  pdf.stroke_horizontal_rule
  pdf.move_down (10)
  pdf.text @pattern.description, :align => :justify

end

pdf.start_new_page

pdf.bounding_box([0, 700], :width => 540, :height => pdf.bounds.height - 65) do
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
            :cell_style => { :padding => 5, :border_width => 0},
            :column_widths => [100, 440]
  pdf.move_down(20)
  pdf.font(boldy)
  pdf.text "Instructions", :align => :center, :size => 18
  pdf.font(normaly)

  @pattern.sections.each do |section|
    pdf.font(boldy)
    pdf.text section.title, :size => 14
    pdf.font(normaly)
    pdf.text section.description
    rows = section.rows.map { |row| ["Row #{row.num}:", row.instructions] }
    pdf.table rows, :cell_style => {:padding => 5, :border_width => 0 },
            :column_widths => [100, 440]
    pdf.move_down 17
    pdf.text section.instructions
    pdf.move_down 10
  end

  if @pattern.images.count > 1
    pdf.start_new_page
    pdf.font(boldy)
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