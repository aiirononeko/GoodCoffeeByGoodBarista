class AddAddressToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :address, :string
  end
end
