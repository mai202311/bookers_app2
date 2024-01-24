class BooksController < ApplicationController
  def new
  end

  def index
     @books = Book.all 
  end
  def create
     book = Book.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # リダイレクト
    redirect_to '/books/' + book.id.to_s
    
  end

  def show
    @books = Book.find(params[:id]) 
  end

  def edit
    @books = Book.find(params[:id]) 
  end
   private
  # ストロングパラメータ
  def book_params
    params.require(:list).permit(:title, :opinion)
  end
end
