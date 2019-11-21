class AddWantToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pualification
    add_column :users, :want, :text
    add_column :users, :qualification, :text
  end
end
