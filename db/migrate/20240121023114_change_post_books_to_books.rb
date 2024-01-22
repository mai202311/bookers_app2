class ChangePostBooksToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_books, :books
  end
end
