require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:post) { Post.create(user: user, title: 'title' , content: 'content') }
  let(:comment) { Comment.create(content: 'content', post: post, user: user) }

  before(:each) do
    sign_in user
  end

  # describe 'POST #create' do
  #   context 'with valid params' do
  #     it 'creates a new comment' do
  #       expect {
  #         post :create
  #       }.to change(post.comments, :count).by(1)
  #     end
  #   end
  # end

  describe 'DELETE #destroy' do
    it 'destroys the requested comment' do
      comment
      expect {
        delete :destroy, params: { post_id: post.id, id: comment.id }, format: :turbo_stream
      }.to change(Comment, :count).by(-1)
    end
  end
end
