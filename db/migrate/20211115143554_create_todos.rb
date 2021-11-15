class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :is_completed, default: false
      t.references :project, null: false, foreign_key: true
    end
  end
end
