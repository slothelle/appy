require 'spec_helper'

describe 'Abbreviation' do
  before do
    login_admin
    @pattern = make_pattern
    visit patterns_path
  end

  context 'from Patterns#index' do
    describe 'for pattern with no abbreviations' do
      it 'should display a warning that there are no abbrevs' do
        expect(page).to have_content("This pattern has no abbreviations.")
      end

      it 'should take user to Abbreviation#new upon clicking button' do
        click_link('Add abbreviations')
        expect(page).to have_content('New Abbreviations')
      end
    end

    describe 'for pattern with abbreviations' do
      it 'should not display a warning' do
        Pattern.destroy_all
        make_abbrev_with_pattern
        visit patterns_path
        expect(page).to have_no_content("This pattern has no abbreviations.")
      end
    end
  end

  context '#new' do
    before do
      visit new_pattern_abbreviation_path(@pattern)
    end

    it 'should display a text for each item in ABBREVIATIONS plus 10 empty ones' do
      page.assert_selector('input[type=text]', count: 50)
    end

    AbbreviationHelper::ABBREVIATIONS.each do |st, defi|
      it "should display a text field with #{st} as stitch" do
        expect(page).to have_xpath("//input[@value='#{st}']")
      end

      it "should display a text field with #{defi} as definition" do
        expect(page).to have_xpath("//input[@value='#{defi}']")
      end
    end
  end

  context '#create' do
    before do
      visit new_pattern_abbreviation_path(@pattern)
    end

    it 'should create abbreviations for the pattern'
    it 'should create an abbreviation for each stitch/definition pair'
  end
end