class AddSlugToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :slug, :string
  end
end
