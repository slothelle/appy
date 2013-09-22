require 'spec_helper'

describe 'Chart' do

  context 'from Patterns#index' do
    describe 'for a pattern with charts' do
      before do
        login_admin
        make_chart_with_pattern
        visit patterns_path
      end

      it 'should not display a warning'
      it 'should display a warning for chart legends'
      it 'should provide an option to add/edit charts'
    end

    describe 'for a pattern with no charts' do
      before do
        login_admin_patterns_index
      end

      it 'should display a warning' do
        expect(page).to have_content("Charts are not required, but this pattern has no charts.")
      end

      it 'should provide an option to add/edit charts' do
        click_link("Edit...")
        expect(page).to have_selector("li.edit-charts")
      end
    end
  end

  context '#new' do
    it 'should add a chart to the pattern'

    describe 'for a pattern with charts' do
      it 'should display all existing charts'
      it 'should delete an existing chart'
    end
  end
end