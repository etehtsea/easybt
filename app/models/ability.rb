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
        can [:create, :read], Release
        can [:update, :destroy], Release do |release|    
          release.user.id == user.id
        end
        can :read,  :all
      end
    end
  end
end