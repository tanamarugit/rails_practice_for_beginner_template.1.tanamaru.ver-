class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :solved_check, null: false, default: false

      t.timestamps
    end
  end
end
