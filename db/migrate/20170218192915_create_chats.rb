class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :comment

      t.timestamps null: false
    end
  end
end
