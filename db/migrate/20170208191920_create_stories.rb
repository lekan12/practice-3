class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :headline
      t.text :summary
      t.string :writer
      t.string :url

      t.timestamps null: false
    end
  end
end
