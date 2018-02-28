class Account < ActiveRecord::Base
  attr_accessible :name
  has_many :n_contacts
  has_many :p_contacts
end
