class AddColumnWinnerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :winner, :integer 
  end
end
