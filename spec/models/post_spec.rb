require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user: user) }

  describe 'attribute: title' do
    context 'when present' do
      # title,imageが存在している場合は、有効であること
      fit 'is valid' do
        post.title = 'Title'
        post.image = fixture_file_upload("fixtures/images/04.png")
        post.save
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
