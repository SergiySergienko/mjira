class AddColumnsToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :slug, :string
    add_column :tickets, :customer_name, :string
    add_column :tickets, :customer_email, :string
    add_index :tickets, :slug
  end
end
