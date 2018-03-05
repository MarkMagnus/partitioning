class Contact < ActiveRecord::Base
  belongs_to :accounts
  attr_accessible :fields, :contact_type

  serialize :fields, ActiveRecord::Coders::JSON
  def fields=(new_value)
    self[:fields] = ActiveRecord::Coders::JSON.load(new_value)
  end
end
