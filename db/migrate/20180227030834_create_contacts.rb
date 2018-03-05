class CreatePContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contact_type
      t.references :account

      t.timestamps
    end
    add_column :contacts, :fields, :jsonb
    add_index :contacts, :account_id
  end
end
