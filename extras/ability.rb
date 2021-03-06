class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      user = User.new # guest user
      can :read, :all
    else
      if user.admin?
        can :manage, :all
      else
        can :create, [Release, Comment]
        can [:update, :destroy], [Release, Comment], :user_id => user.id
        can :read, :all
      end
    end
  end
end
