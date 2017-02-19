class AddUsernameToStories < ActiveRecord::Migration
  def change
    add_column :stories, :username, :string
  end
end
