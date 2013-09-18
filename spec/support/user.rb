module UserHelper
  def login_admin
    user = make_editor
    # visit login_path
    # fill_in("session[email]", :with => "suzy@queue.com")
    # fill_in("session[password]", :with => "password123456")
    # click_button("Login")
  end

  def login_editor
    user = make_editor
  end

  def login_tester
    user = make_tester
  end

  def make_admin
    FactoryGirl.create(:user_admin)
  end

  def make_editor
    FactoryGirl.create(:user_editor)
  end

  def make_tester
    FactoryGirl.create(:user_tester)
  end
end