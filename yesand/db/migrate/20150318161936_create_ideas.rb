class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
    	t.string :title
    	t.text :description
    	t.belongs_to :creator

    	t.timestamps
    end
  end
end
