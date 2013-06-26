class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
    end
  end
end
