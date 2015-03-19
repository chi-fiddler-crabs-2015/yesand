class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
    	t.string :title, unique: true, index: true
    	t.text :description
    	t.belongs_to :creator, index: true

    	t.timestamps
    end
  end
end
