require "activerecord/always_reset_column_information/version"
require "activerecord/always_reset_column_information/migration"
require "active_record"
require "active_record/migration"

ActiveRecord::Migration.prepend Activerecord::AlwaysResetColumnInformation::Migration
