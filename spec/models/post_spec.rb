require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validate' do
    it { is_expected.to validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'owned_by method' do
    let(:user) { User.create(email: 'user1@example.com', password: 'password') }
    let(:user1) { User.create(email: 'user1@example.com', password: 'password') }
    let(:post) { Post.create(title: 'title', content: 'content', user: user) }

    context 'when the post is owned by the user' do
      it 'return true' do
        expect(post.owned_by?(user)).to be_truthy
      end
    end

    context 'when the post is not owned by the user' do
      it 'return false' do
        expect(post.owned_by?(user1)).to eq(false)
      end
    end
  end
end
