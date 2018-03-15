namespace :n_contacts do

  desc "run"
  task :run, [:n] => :environment do |t, args|

    no_of_contacts = args[:n].to_i

    puts "sample size #{no_of_contacts}"

    Rake::Task["insert"].invoke(no_of_contacts)
    Rake::Task["update"].invoke
    Rake::Task["count"].invoke
    Rake::Task["search_per_account"].invoke
    Rake::Task["search_all_accounts"].invoke
    Rake::Task["delete"].invoke
  end

  desc "purge"
  task :purge => :environment do
    puts "purge"

    start = Time.now

    NContact.delete_all

    finish = Time.now

    puts "time taken #{finish - start} seconds"
  end

  desc "insert"
  task :insert, [:n] => :environment do |t, args|
    puts "insert"

    no_of_contacts = args[:n].to_i

    accounts = Account.all

    count = 0

    start = Time.now

    no_of_contacts.times do
      accounts.each do |account|
        create_contact(account)
        count += 1
      end
    end

    finish = Time.now

    puts "created #{count} contacts"
    puts "time taken #{finish - start} seconds"
  end

  desc "update"
  task :update => :environment do
    puts "update"

    accounts = Account.all
    count = 0

    start = Time.now

    accounts.each do |account|
      update_contacts(account)
      count += 1
    end

    finish = Time.now

    puts "updated #{count} contacts"
    puts "time taken #{finish - start} seconds"
  end

  desc "count"
  task :count => :environment do
    puts "count"

    accounts = Account.all

    start = Time.now

    accounts.each do |account|
      account.n_contacts.count
    end

    finish = Time.now

    puts "time taken #{finish - start} seconds"
  end

  desc "search_per_account"
  task :search_per_account => :environment do
    puts "search per account"

    accounts = Account.all

    start = Time.now

    accounts.each do |account|
      type = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
      name = Faker::Name.name
      email = Faker::Internet.email(name)
      account.n_contacts.where("fields->>'name' like ?", name)
          .where("fields->>'email' like ?", email)
          .where("contact_type = ?", type)
    end

    finish = Time.now

    puts "time taken #{finish - start} seconds"
  end

  desc "search_all_accounts"
  task :search_all_accounts => :environment do
    puts "search all accounts"

    start = Time.now

    100.times do
      type = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
      name = Faker::Name.name
      email = Faker::Internet.email(name)
      NContact.where("fields->>'name' like ?", name)
          .where("fields->>'email' like ?", email)
          .where("contact_type = ?", type)
    end

    finish = Time.now

    puts "time taken #{finish - start} seconds"
  end

  desc "delete"
  task :delete => :environment do
    puts "delete"

    accounts = Account.all

    start = Time.now

    accounts.each do |account|
      account.n_contacts.each do |contact|
        contact.delete
      end
    end

    finish = Time.now

    puts "time taken #{finish - start} seconds"
  end

  def update_contacts(account)
    account.n_contacts.all.each do |contact|
      contact.contact_type = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
      name = Faker::Name.name
      email = Faker::Internet.email(name)
      contact.fields = {name: name, email: email}
      contact.save
    end
  end

  def create_contact(account)
    type = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
    name = Faker::Name.name
    email = Faker::Internet.email(name)
    account.n_contacts.create(contact_type: type, fields: {name: name, email: email})
  end

end
