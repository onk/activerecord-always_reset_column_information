class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
    end
    User.create(name: "Taro")
  end
end
