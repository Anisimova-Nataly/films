class AddDetailsToDvd < ActiveRecord::Migration
  def change
    add_column :dvds, :cover_type, :string
  end
end
