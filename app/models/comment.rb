class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_counter

  def update_counter
    post.increment!(:comments_counter)
  end

  def as_json(_options = {})
    super(only: %i[text author_id post_id])
  end
end
