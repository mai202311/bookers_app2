class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      @errors = @book.errors.full_messages  # エラーメッセージを取得
      flash[:alert] = "Failed to update. Please fix the following errors: #{@errors}"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy  # 削除
       flash[:notice] = "You have destroy book successfully."
       redirect_to books_path  # 投稿一覧画面へリダイレクト
    else
      flash[:alert] = "You failed to post destroy."
      render :edit
    end
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
  unless @book.user.id == current_user.id
    redirect_to books_path
  end
  end
end
