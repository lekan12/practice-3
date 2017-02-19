class ReviewsController < ApplicationController
	before_action :find_story
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	if current_user 
		@review = Review.where(user_id: current_user.id, story_id: params[:story_id]).first_or_initialize 
    if @review.id.present? 
      render 'edit' 
    end 
	end 
	end

	def create
		@review = Review.new(review_params)
		@review.story_id = @story.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to story_path(@story)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to story_path(@story)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to story_path(@story)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_story
			@story = Story.find(params[:story_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end