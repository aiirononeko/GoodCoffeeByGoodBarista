class AddStatusToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :status, :string
  end
end
