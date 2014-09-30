class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :contact, index: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :contact_id], unique: true
  end
end
