class AddPublicationToStories < ActiveRecord::Migration
  def change
    add_column :stories, :publication, :string
  end
end
