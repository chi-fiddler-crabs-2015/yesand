class Vote < ActiveRecord::Base
	belongs_to :voter, class_name: 'User'
	belongs_to :votable, polymorphic: true

  validates :voter, :votable, presence: true
  validates :voter, uniqueness: { scope: :votable,
    message: "you can only vote once on this!" }

end
