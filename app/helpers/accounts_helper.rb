module AccountsHelper

  def number_of_contacts(account_id)
    Contact.where(account_id: account_id).count
  end

end
