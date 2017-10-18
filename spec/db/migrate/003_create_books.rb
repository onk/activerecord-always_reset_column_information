class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
    end
    Book.create(name: "Agile Web Development with Rails")
  end
end
