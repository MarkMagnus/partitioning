class CreateNContacts < ActiveRecord::Migration
  def change
    create_table :n_contacts do |t|
      t.integer :type
      t.references :account
      t.jsonb :fields

      t.timestamps
    end
    add_index :n_contacts, :account_id
  end
end
