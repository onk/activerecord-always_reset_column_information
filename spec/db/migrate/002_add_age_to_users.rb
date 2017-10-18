class AddAgeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    User.create(name: "Jiro", age: 16)
  end
end
