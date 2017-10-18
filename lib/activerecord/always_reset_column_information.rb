require "activerecord/always_reset_column_information/version"
require "active_record"
require "active_record/migration"

module ActiveRecord
  class Migrator
    private

      # Used for running multiple migrations up to or down to a certain value.
      def migrate_without_lock
        if invalid_target?
          raise UnknownMigrationVersionError.new(@target_version)
        end

        result = runnable.each do |migration|
          execute_migration_in_transaction(migration, @direction)
          # vvvvvvvvv Add this line
          ActiveRecord::Base.subclasses.each(&:reset_column_information)
          # ^^^^^^^^^
        end

        record_environment
        result
      end
  end
end
