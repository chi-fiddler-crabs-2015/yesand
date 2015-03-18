class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.belongs_to :voter
    	# POLYMORPHIC STUFF ABOUT BELONGING TO A COMMENT OR IDEA

    	t.timestamps
    end
  end
end
