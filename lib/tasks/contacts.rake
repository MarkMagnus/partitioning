namespace :contacts do
  desc "up"
  task :up => :environment do
    accounts = []
    1000.times do
      accounts << Account.create(name: Faker::Company.name)
    end

    types = [1,2,3,4,5,6,7,8,9,10]

    10000.times do
      type = types.sample
      account = accounts.sample
      name = Faker::Name.name
      email = Faker::Internet.email(name)

      account.contacts.create(type: type, fields: {name: name, email: email})
    end
  end

  desc "down"
  task :down => :environment do
    Account.delete_all
    Contact.delete_all
    PContact.delete_all
  end

end
