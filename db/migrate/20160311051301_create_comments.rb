class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :score, null: false, default: 0
      t.belongs_to :user
      t.belongs_to :topic
      t.timestamps null: false
    end
  end
end
