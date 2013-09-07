require 'spec_helper'

describe 'User' do
  before do
    seed
  end

  context 'logged in' do
    before do
      login
    end

    it "does things"
  end

  context 'logged out' do
    it "doesn't do anything"
  end
end