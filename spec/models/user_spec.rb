require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'メールアドレス・パスワード・パスワード確認が存在すること' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'メールアドレスが無い場合不正であること' do
      user_without_email = build(:user, email: nil)
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ['を入力してください']
    end

    it 'メールアドレスがユニークでなければ不正であること' do
      user_one = create(:user)
      user_another = build(:user, email: user_one.email)
      expect(user_another).to be_invalid
      expect(user_another.errors[:email]).to eq ['はすでに存在します']
    end

    it 'パスワードが無い場合不正であること' do
      user_without_password = build(:user, password: nil)
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ['は6文字以上で入力してください']
    end
  end
end
