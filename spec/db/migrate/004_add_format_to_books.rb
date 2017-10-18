class AddFormatToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :format, :string
    Book.create(name: "Ruby for Rails", format: "ebook")
  end
end
