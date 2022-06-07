require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  describe 'ログイン' do
    let!(:user){create(:user)}
    context '正常系' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in 'email', with: user.email 
        fill_in 'password', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq root_path
      end
    end
  end
end