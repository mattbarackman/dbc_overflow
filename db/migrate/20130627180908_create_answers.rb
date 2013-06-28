class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.references :question
      t.references :user
      t.timestamps
    end
  end
end
