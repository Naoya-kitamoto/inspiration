class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :subject, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
