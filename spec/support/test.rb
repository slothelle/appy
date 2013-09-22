module TestHelper
  def login_admin_patterns_index
    login_admin
    @pattern = make_pattern
    visit patterns_path
  end
end