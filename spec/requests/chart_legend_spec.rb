require 'spec_helper'

describe 'ChartLegend' do
  before do
    login_admin_patterns_index
  end

  context 'from Patterns#index' do
    describe 'for a pattern with no charts' do
      it 'should not display a warning' do
        expect(page).to have_no_content("This pattern has a chart but no chart legends.")
      end

      it 'should not display the ability to add/edit chart legends' do
        expect(page).to have_no_content("Chart Legends")
      end
    end

    describe 'for a pattern with charts but no legends' do
      before do
        Pattern.destroy_all
        make_chart_with_pattern
        visit patterns_path
      end

      it 'should display a warning' do
        expect(page).to have_content("This pattern has a chart but no chart legends.")
      end

      it 'should provide an option to add/edit chart legends' do
        click_link("Edit...")
        expect(page).to have_content("Chart Legends")
      end
    end
  end

  context '#new' do
    it 'should add a chart legend to the pattern'

    describe 'with an existing chart legend' do
      before do
        Pattern.destroy_all
        legend = make_chart_legend_with_pattern
        visit new_pattern_chart_legend_path(legend.pattern)
      end

      it 'should display all existing chart legends' do
        page.assert_selector('img.thumbnail', count: 1)
      end

      it 'should delete an existing chart legend' do
        expect{
          click_link('Delete legend')
        }.to change{ChartLegend.count}.from(1).to(0)
      end
    end
  end
end