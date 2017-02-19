class User < ActiveRecord::Base
	has_many :stories
	has_many :reviews
	has_many :chats
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end