RSpec.describe Activerecord::AlwaysResetColumnInformation do
  describe "ActiveRecord::Migrator.migrate" do
    subject { ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths) }
    specify do
      # not to raise_error ActiveModel::UnknownAttributeError: unknown attribute 'age' for User.
      expect { subject }.not_to raise_error
    end
  end
end
