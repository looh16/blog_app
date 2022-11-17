class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'post_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'post_id'

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_counter

  def latest_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_counter
    author.increment!(:posts_counter)
  end
end
