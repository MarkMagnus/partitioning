class PContact < ActiveRecord::Base
  belongs_to :account
  attr_accessible :fields, :type

  serialize :fields, ActiveRecord::Coders::JSON
end
