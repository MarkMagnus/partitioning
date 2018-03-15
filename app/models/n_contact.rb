class NContact < ActiveRecord::Base
  belongs_to :accounts
  attr_accessible :fields, :contact_type

  serialize :fields, ActiveRecord::Coders::JSON
end
