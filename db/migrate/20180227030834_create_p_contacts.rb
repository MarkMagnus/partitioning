class CreatePContacts < ActiveRecord::Migration
  def change
    create_table :p_contacts do |t|
      t.integer :type
      t.references :account
      t.jsonb :fields

      t.timestamps
    end
    add_index :p_contacts, :account_id
  end
end
