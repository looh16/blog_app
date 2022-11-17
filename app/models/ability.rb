class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Post, author: user
    can :manage, Comment, author: user
    can :read, :all
    return unless user.role == 'admin'

    can :manage, :all
  end
end
