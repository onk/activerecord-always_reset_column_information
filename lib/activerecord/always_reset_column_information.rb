require "activerecord/always_reset_column_information/version"
require "activerecord/always_reset_column_information/migrator"
require "active_record"
require "active_record/migration"

ActiveRecord::Migrator.prepend Activerecord::AlwaysResetColumnInformation::Migrator
