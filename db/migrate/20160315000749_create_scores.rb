class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.boolean :liked, null: false
      t.belongs_to :user
      t.references :post, polymorphic: true, index: true
    end
  end
end
