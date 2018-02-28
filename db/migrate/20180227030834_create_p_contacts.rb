class CreatePContacts < ActiveRecord::Migration
  def change
    create_table :p_contacts do |t|
      t.integer :type
      t.references :account

      t.timestamps
    end
    add_column :p_contacts, :fields, :jsonb
    add_index :p_contacts, :account_id
  end
end
