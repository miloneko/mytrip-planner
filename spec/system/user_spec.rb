require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'メールアドレス・パスワード・パスワード確認・名全て存在し、パスワードは6字以上で有効であること' do
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

    it 'パスワードが6字未満の場合不正であること' do
      user_with_two_character_password = build(:user, password: 'ab')
      expect(user_with_two_character_password).to be_invalid
      expect(user_with_two_character_password.errors[:password]).to eq ['は6文字以上で入力してください']
    end

    it 'パスワード確認が無い場合不正であること' do
      user_without_password_confirmation = build(:user, password_confirmation: nil)
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ['を入力してください']
    end

    it '名が無い場合不正であること' do
      user_without_first_name = build(:user, name: nil)
      expect(user_without_first_name).to be_invalid
      expect(user_without_first_name.errors[:name]).to eq ['を入力してください']
    end
  end
end
