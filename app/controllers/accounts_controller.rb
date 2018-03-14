class AccountsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
    @accounts = Account.all
  end

  def search()
    if request.post?
      name = params['name'] ? "%" + params['name'] + "%" : "%"
      email = params['email'] ? "%" + params['email'] + "%" : "%"
      type = params['type'] ? params['type'].to_i : 0

      @contacts = Contact.where("fields->>'name' like ?", name)
                      .where("fields->>'email' like ?", email)
                      .where("contact_type = ? or 0 = ?", type, type)
                      .limit(100)
      # .includes(:accounts)
    else
      @contacts = nil
    end

  end
end
