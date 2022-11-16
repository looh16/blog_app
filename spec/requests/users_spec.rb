require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    subject { get '/users' }

    it 'should render index template' do
      expect(subject).to render_template(:index)
    end

    it 'response status should be correct' do
      expect(subject).to eq(200)
    end
  end

  describe 'GET /show' do
    before(:example) do
      user = User.create(
        name: 'John',
        photo: 'https://www.google.com/search?q=john&sxsrf=ALiCzsbQQRI9Eat2m6k3TYnGLlvZv89q-A:1667476429189&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjgte7h-ZH7AhUMT8AKHRnyAjQQ_AUoAXoECAIQAw&biw=1920&bih=943&dpr=1#imgrc=nn5eTpN4BMNWiM',
        bio: 'John',
        posts_counter: 0
      )
      get "/users/#{user.id}"
    end

    it 'should render show template' do
      expect(response).to render_template('show')
    end

    it 'response status should be correct' do
      expect(response).to have_http_status(:ok)
    end
  end
end
