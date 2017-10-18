module Activerecord::AlwaysResetColumnInformation::Migration
  def exec_migration(conn, direction)
    super
    ActiveRecord::Base.descendants.each(&:reset_column_information)
  end
end
