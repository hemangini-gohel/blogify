require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    sign_in user
  end

  let(:valid_attributes) {
    { title: 'Test Title', content: 'Test Content', user: user }
  }

  let(:invalid_attributes) {
    { title: '', content: '', user_id: nil }
  }

  let(:user) { User.create(email: 'test@example.com', password: 'password') }


  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :edit, params: { id: post.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(Post.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { title: 'New Title' }
      }

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: new_attributes }
        post.reload
        expect(post.title).to eq('New Title')
      end

      it 'redirects to the post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: valid_attributes }
        expect(response).to redirect_to(post)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: { id: post.to_param }
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = Post.create! valid_attributes
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(posts_url)
    end
  end
end
