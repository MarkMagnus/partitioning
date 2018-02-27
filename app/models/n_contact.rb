class NContact < ActiveRecord::Base
  belongs_to :account
  attr_accessible :fields, :type
end
