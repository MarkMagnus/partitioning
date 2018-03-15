namespace :accounts do
  desc "up"
  task :up => :environment do
    1000.times do
      Account.create(name: Faker::Company.name)
    end
  end

  desc "down"
  task :down => :environment do
    Contact.delete_all
    Account.delete_all
  end

end