class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, index: true, unique: true
    	t.string :email, unique: true
    	t.string :password_hash
    	t.text :bio

    	t.timestamps
    end
  end
end
