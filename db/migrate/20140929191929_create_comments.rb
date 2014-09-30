class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, index: true, polymorphic: true
      t.text :body
      t.integer :author_id

      t.timestamps
    end
    add_index :comments, :author_id
  end
end
