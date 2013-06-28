class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, unique: true
      t.text   :content
      t.references :user
      t.timestamps
    end
  end
end
