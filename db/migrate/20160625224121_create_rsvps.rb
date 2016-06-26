class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :email
      t.string :name
      t.string :code
      t.boolean :coming
      t.boolean :overnight
      t.string :additional_guest
      t.text :message

      t.timestamps null: false
    end
  end
end
