# ApplicationContoroller<ActionController::Baseを継承している
class PostsController < ApplicationController
  # 誰もが見れる画面をログイン処理をスキップする
  #  対象:投稿一覧、詳細、検索
  skip_before_action :require_login, only: %i[index show search]
  # 一覧、検索の処理を行う前に、set_qのメソッドを呼び起こす
  before_action :set_q, only: %i[index search]
  
  # 投稿の新規作成
  def new
    # 空のPostインスタンスを生成
    @post = Post.new
  end
  
  # 投稿を新規作成して保存する
  def create
    # Userインスタンスに紐付いたPostインスタンスを生成する
    # ストロングパラメータで受け取る
    @post = current_user.posts.build(post_params)
    # 選択したカテゴリーを取得
    @categories = Category.where(id: @post.category_ids)
    # 投稿が保存されたとき
    if @post.save
      # 投稿しましたというフラッシュメッセージを表示させる
      flash[:notice] = t('.success')
      # 投稿一覧画面に遷移
      redirect_to posts_path
      # 保存されなかった時
    else
      # 新規投稿作成の処理へ戻る
      render :new
    end
  end
  
  # 投稿の一覧
  def index
    # 投稿を最新順に、１ページに6投稿ずつデータを表示させる
    @posts = Post.all.includes(:user).order(created_at: :desc).page(params[:page]).per(6)
    # GooglemapにPosrのaddressに紐づいたピンを表示させる
    @mappin = Post.all
   # 投稿のカテゴリーとUserカテゴリー（Userが登録した好きなカテゴリー）が一致している投稿を3件表示させる
    @recommendposts = Post.where(id: PostCategory.where(category_id: UserCategory.where(user_id: current_user&.id).map(&:category_id)).map(&:post_id)).limit(3)
  end
  # 投稿詳細
  def show
    # Postのレコードを１件取り出す
    @post = Post.find(params[:id])
    # 空のcommentインスタンスを作成
    @comment = Comment.new
    # 最新順に表示、N+1問題に対応するためincludesを用いて、テーブルから一つ一つ検索して呼び出すのではなく一括で呼び出す
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end
  # 投稿の編集
  def edit
    # current_userと紐づいている投稿を１件取得する
    @post = current_user.posts.find(params[:id])
  end
  # 投稿の更新
  def update
    # current_userと紐づいている投稿を１件取得する
    @post = current_user.posts.find(params[:id])
    # 投稿が更新されたら
    if @post.update(post_params)
      # 投稿詳細に遷移する
      # redirect_to @model　でそのモデルの詳細ページに遷移する
      # 更新しましたというフラッシュメッセージを表示させる
      redirect_to @post, notice: t('defaults.message.updated')
    else
      # 更新が保存されなかった場合、投稿が更新できませんでしたというフラッシュメッセージを表示させる
      flash.now['danger'] = t('defaults.message.not_updated')
      render :edit
    end
  end
  # 投稿の削除
  def destroy
    # current_userと紐づいている投稿を１件取得する
    @post = current_user.posts.find(params[:id])
    # 投稿を削除する (できなかったらActiveRecord::RecordNotDestroyed例外を発生させる)
    @post.destroy!
    # 投稿一覧ページに遷移する　投稿を削除しましたというフラッシュメッセージを表示させる
    redirect_to posts_path, notice: t('defaults.message.deleted')
  end
  # 検索機能
  def search
    # @qの情報からSQLクエリを発行し、その結果がActiveRecord::Relationオブジェクトで入っていてそのデータを１ページに６件ずつ表示させている
    # (distinct: true)重複レコードを1つにまとめる
    @results = @q.result(distinct: true).page(params[:page]).per(6)
  end
  # 投稿のいいね機能
  # 必要ない？
  # def likes
   # @like_posts = current_user.like_posts.include(:user).order(created_at: :desc)
  # end

  private

  # qというパラメーターをビューに渡す
  def set_q
    # パラメーターをもとにPostのデータを検索する
    @q = Post.ransack(params[:q])
    # ransackメソッドで取得したデータの結果　N+1問題を解消するために、テーブルから一つ一つ検索するのではなく一括で呼び出す　ページネーションする
    # ここでいうuserはpostのクラスのリレーション(belongs_to :user)
    @posts = @q.result.includes(:user).page(params[:page])
  end
  # ストロングパラメーター
  def post_params
    # params[:post]から取り出していいから取り出していい情報は、:image, :image_cache, :title, :user, :address, :latitude, :longitude, :location_id, category_ids: []のみで他の情報は取り出せない。
    params.require(:post).permit(:image, :image_cache, :title, :user, :address, :latitude, :longitude, :location_id, category_ids: [])
  end
end
