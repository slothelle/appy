require 'spec_helper'

describe SessionHelper do
  context '#current_user' do
    it "should return current user object if it exists"
    it "should set @current_user"
    it "should return false if user does not exist"
  end

  context '#is_user?' do
    it "should return true if current_user == resource owner"
    it "should return false if current_user != resource owner"
    it "should return false if !current_user"
  end

  context '#create_session' do
    it "should create a session with the user's id"
  end

  context '#end_session' do
    it "should set the session for the user's id to nil"
  end
end