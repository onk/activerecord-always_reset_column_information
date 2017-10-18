# prepare migrations
ActiveRecord::Base.configurations["test"] = {
  adapter: "sqlite3",
  database: ":memory:"
}
ActiveRecord::Base.establish_connection(:test)
ActiveRecord::Migrator.migrations_paths += ["spec/db/migrate"]
ActiveRecord::Migration.verbose = false
