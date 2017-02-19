class ChatsController < ApplicationController
before_action :find_story
	before_action :find_chat, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@chat = Chat.new
	end

	def create
		@chat = Chat.new(chat_params)
		@chat.story_id = @story.id
		@chat.user_id = current_user.id

		if @chat.save
			redirect_to story_path(@story)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @chat.update(chat_params)
			redirect_to story_path(@story)
		else
			render 'edit'
		end
	end

	def destroy
		@chat.destroy
		redirect_to story_path(@story)
	end

	private

		def chat_params
			params.require(:chat).permit(:comment)
		end

		def find_story
			@story = Story.find(params[:story_id])
		end

		def find_chat
			@chat = Chat.find(params[:id])
		end

end
