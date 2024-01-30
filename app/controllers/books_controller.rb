class BooksController < ApplicationController
  def new
  end

  def index
     @books = Book.all
     @user = current_user.id
  end
  def create
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド
    book.user_id = current_user.id #投稿したユーザーを取得
    if book.save
       flash[:notice] = "You have created book successfully.。"
       redirect_to book_path(book.id)
    else
      flash[:notice] = "error:You failed to post."
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def update
    if book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(book.id)
    else
       flash[:alert] = "You failed to destroy."
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy  # 削除
       redirect_to '/books'  # 投稿一覧画面へリダイレクト
    else
      flash[:alert] = "You failed to post."
      render :edit
    end
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
