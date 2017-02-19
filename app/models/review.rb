class Review < ActiveRecord::Base
	belongs_to :story
	belongs_to :user

 validates :story_id, uniqueness: { scope: :user_id, message: "You've already reviewed this story!" }
end