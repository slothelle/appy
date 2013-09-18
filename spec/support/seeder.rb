module SeederHelper
  def make_pattern
    FactoryGirl.create(:pattern)
  end

  def make_section_with_pattern
    FactoryGirl.create(:section)
  end

  def make_row_with_section_pattern
    FactoryGirl.create(:row)
  end

  def make_image_with_pattern
    FactoryGirl.create(:image)
  end

  def make_abbrev_with_pattern
    FactoryGirl.create(:abbreviation)
  end

  def make_chart_with_pattern
    FactoryGirl.create(:chart)
  end

  def make_chart_legend_with_pattern
    FactoryGirl.create(:chart_legend)
  end

  def make_comment_with_tester_pattern
    FactoryGirl.create(:comment_tester)
  end
end