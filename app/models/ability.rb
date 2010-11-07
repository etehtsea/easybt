class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      user = User.new
      can :read, :all
    else
      if user.admin?
        can :manage, :all
      else
        can :create, Release
        can [:update, :destroy], Release, :user_id => user.id
        can :read, :all
      end
    end
  end
end