module Activerecord::AlwaysResetColumnInformation::Migrator
  def execute_migration_in_transaction(migration, direction)
    super
    ActiveRecord::Base.descendants.each(&:reset_column_information)
  end
end
