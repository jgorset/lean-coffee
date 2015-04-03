namespace :db do
  desc "Add constraint to votes on topics. Vote >= 0"
  task add_constraints: :environment do
    ActiveRecord::Base.connection.execute <<-SQL
      ALTER TABLE topics ADD CONSTRAINT positive_votes CHECK (votes >= 0);
    SQL
  end

  desc "Removes constraint to votes on topics."
  task remove_constraints: :environment do
    ActiveRecord::Base.connection.execute <<-SQL
      ALTER TABLE topics DROP CONSTRAINT positive_votes;
    SQL
  end

end
