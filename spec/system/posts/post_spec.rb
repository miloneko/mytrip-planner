RSpec.describe '投稿', type: :system do
  # 未ログインの場合新規登録しようとすると、ログイン画面に遷移する
  # ログイン済みの場合投稿が作成できる
  # 掲示板を作成すると投稿しましたというフラッシュメッセージと、投稿一覧に遷移する
  #
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe '投稿一覧機能' do
    context 'Loginしている場合' do
      before do
        login_as(user)
      end

      it '一覧画面にアクセスできること' do
        click_on 'Posts'
        expect(current_path).to eq posts_path
      end
    end
  end
end
