class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :complete, null: false
      t.integer :list_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
