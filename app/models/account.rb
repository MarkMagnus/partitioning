class Account < ActiveRecord::Base
  attr_accessible :name

  has_many :contacts
  has_many :n_contacts
end
