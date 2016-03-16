class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :link_topic, null: false, default: false
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
