class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @account = Account.find(params["account_id"])
    @contacts = @account.contacts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @account = Account.find(params["account_id"])
    @contact = @account.contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @account = Account.find(params["account_id"])
    @contact = @account.contacts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @account = Account.find(params["account_id"])
    @contact = @account.contacts.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @account = Account.find(params["account_id"])
    @contact = @account.contacts.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to account_contact_path(@account.id, @contact.id), notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @account = Account.find(params["account_id"])
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to account_contact_path(@account.id, @contact.id), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to account_contacts_url }
      format.json { head :no_content }
    end
  end
end
