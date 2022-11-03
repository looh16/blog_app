require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is not valid without author' do
    comment = Comment.new(author: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without post' do
    comment = Comment.new(post: nil)
    expect(comment).to_not be_valid
  end
end
