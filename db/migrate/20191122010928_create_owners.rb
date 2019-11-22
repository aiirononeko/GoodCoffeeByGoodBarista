class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :company, null: false
      t.string :name, null: false
      t.string :tel, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :title
      t.text :about
      t.text :introduce
      t.text :wanted

      t.timestamps
    end
  end
end
