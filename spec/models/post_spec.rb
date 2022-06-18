require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe 'attribute: title' do
    context 'when present' do
      # titleが存在している場合は、有効であること
      it 'is valid' do
        post.title = 'Title'
        expect(post).to be_valid
      end
    end

    context 'when blank' do
      # titleが空白の場合は、無効であること
      it 'is invalid' do
        post.title = ' '
        expect(post).to be_invalid
        expect(post.errors[:title]).to eq ['を入力してください']
      end
    end

    context 'when blank' do
      it 'is invalid' do
        post.image = ' '
        expect(post).to be_invalid
        expect(post.errors[:image]).to eq ['を入力してください']
      end
    end
  end
end
