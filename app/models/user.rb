class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def last_posts
    posts.order(created_at: :desc).limit(3)
  end

end
