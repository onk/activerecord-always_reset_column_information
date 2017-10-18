# Activerecord::AlwaysResetColumnInformation

## What's this

Call `Model.reset_column_information` for each migrations.

## Why `reset_column_information` is needed?

```ruby
# 001_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :name
    end
    p User.first # 1
  end
end

# 002_add_age_to_users.rb
class AddAgeToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :age, :integer  # 2
    User.create(name: "Taro", age: 16) # 3
  end
end
```

1 Touch `User` model and columns are chaced.<br>
2 Add column to `users` table. but `User`'s column cache is still keeping.<br>
3 Create user with new column but raise `ActiveModel::UnknownAttributeError: unknown attribute 'age' for User.`

You can change `002_add_age_to_users.rb` to ensure that creating user.

```diff
 class AddAgeToUsers < ActiveRecord::Migration[5.1]
   def up
     add_column :users, :age, :integer
+    User.reset_column_information
     User.create(name: "Taro", age: 16)
   end
 end
```

But `Reset after touch` in `001_create_users.rb` is better approach.

```diff
 class CreateUsers < ActiveRecord::Migration[5.1]
   def up
     create_table :users do |t|
       t.string :name
     end
     p User.first
+    User.reset_column_information
   end
 end
```


## What does this gem do?

Reset all models for each migrations.

Implementation is only this.

```ruby
module Activerecord::AlwaysResetColumnInformation::Migration
  def exec_migration(conn, direction)
    super
    ActiveRecord::Base.descendants.each(&:reset_column_information)
  end
end

ActiveRecord::Migration.prepend Activerecord::AlwaysResetColumnInformation::Migration
```


## Usage

Add this line to your application's Gemfile:

```ruby
gem "activerecord-always_reset_column_information"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
