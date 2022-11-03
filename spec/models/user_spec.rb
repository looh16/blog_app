require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      photo: 'https://www.google.com/search?q=john&sxsrf=ALiCzsbQQRI9Eat2m6k3TYnGLlvZv89q-A:1667476429189&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjgte7h-ZH7AhUMT8AKHRnyAjQQ_AUoAXoECAIQAw&biw=1920&bih=943&dpr=1#imgrc=nn5eTpN4BMNWiM',
      bio: 'John',
      posts_counter: 0
    )
  end

  before { subject.save }

  it 'name cannot be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter must have a numeric value' do
    subject.posts_counter = 'John'
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be greater than or equal to zero' do
    subject.posts_counter = -10
    expect(subject).to_not be_valid
  end

  it 'should have three last posts' do
    expect(subject.last_posts).to eq(subject.posts.last(3))
  end
end
