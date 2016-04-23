class AddDetailsToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :cover_file_size, :string
    add_column :cart_items, :cover_file_name, :string
    add_column :cart_items, :cover_content_type, :string
    add_column :cart_items, :cover_updated_at, :string
  end
end
