class CreateTickets < ActiveRecord::Migration
  def change

    create_table :ticket_statuses do |t|
      t.string :title, :null => false
    end

    create_table :tickets do |t|
      t.string :title, :null => false, :default => ""
      t.text :description, :null => false
      t.belongs_to :accepted_by, :class => "User"
      t.belongs_to :ticket_status

      t.timestamps
    end

    create_table :comments do |t|
      t.string :body, :null => false
      t.belongs_to :ticket
      t.timestamps
    end

  end
end
