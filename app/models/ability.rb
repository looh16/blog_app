# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all
    return unless user.present?

    can :create, Like
    can :create, Comment
    can :create, Post
    can :destroy, Post do |post|
      post.try(:user) == user
    end
    can :destroy, Comment do |comment|
      comment.try(:user) == user
    end
    can :destroy, Like do |like|
      like.try(:user) == user
    end
    can :update, Post do |post|
      post.try(:user) == user
    end
    can :update, Comment do |comment|
      comment.try(:user) == user
    end
    return unless user.admin?

    can :manage, :all

end
