class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :link_topic, null: false, default: false
      t.integer :score, null: false, default: 0
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
