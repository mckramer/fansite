class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :manage, [Post, Event, Medium, MediaProvider]
      can :update, [User]
    elsif user.moderator?
      # can :update, Comment
      can :read, [Post, Event, Medium]
    elsif user.new_record? == false
      # can :create, Comment
      # can :update, Comment, :user_id => user.id
      can :read, [Post, Event, Medium]
    else
      # Anonymous
      can :read, [Post, Event, Medium]
    end
    
    # Testing, by granting full permissions
    can :manage, :all
  end
end
