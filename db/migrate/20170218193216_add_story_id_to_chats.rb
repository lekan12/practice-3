class AddStoryIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :story_id, :integer
  end
end
