class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can [:read, :update], Pattern, :state => { :editing => true }
    elsif user.tester?
      can :read, Pattern, :state => { :testing => true }
    end
  end
end
