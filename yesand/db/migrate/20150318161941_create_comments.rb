class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :text
    	t.belongs_to :idea
    	t.belongs_to :author
    	# POLYMOPHIC STUFF FOR BELONGING TO COMMENTS

    	t.timestamps
    end
  end
end
