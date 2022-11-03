require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    author = User.create(name: 'John',
                         photo: 'https://www.google.com/search?q=john&sxsrf=ALiCzsbQQRI9Eat2m6k3TYnGLlvZv89q-A:1667476429189&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjgte7h-ZH7AhUMT8AKHRnyAjQQ_AUoAXoECAIQAw&biw=1920&bih=943&dpr=1#imgrc=nn5eTpN4BMNWiM',
                         bio: 'John',
                         posts_counter: 0)
    subject do
      Post.new(title: 'Challenge',
               text: 'Never give up',
               author:, comments_counter: 0,
               likes_counter: 0)
    end

    before { subject.save }

    it 'likesCounter must greater than or equal zero.' do
      subject.likes_counter = -10
      expect(subject).to_not be_valid
    end

    it 'title must not exceed 250 characters.' do
      subject.title = 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
                       qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
                       qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'
      expect(subject).to_not be_valid
    end

    it 'title must not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Post should have five recent comments' do
      expect(subject.latest_comments).to eq(subject.comments.last(5))
    end
  end
end
