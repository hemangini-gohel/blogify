require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content)  }
  end

  describe 'owned by method' do
    let(:user) { User.create(email: 'user1@example.com', password: 'password') }
    let(:user1) { User.create(email: 'user1@example.com', password: 'password') }
    let(:post) { Post.create(title: 'title', content: 'content', user: user) }
    let(:comment) { Comment.create(content: 'cm content', user: user) }

    context 'when the post is owned by the user' do
      it 'return true' do
        expect(comment.owned_by?(user)).to be(true)
      end
    end

    context 'when the post is not owned by the user' do
      it 'return false' do
        expect(comment.owned_by?(user1)).to eq(false)
      end
    end
  end
end