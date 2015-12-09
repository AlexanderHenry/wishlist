class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #user has many lists (and lists have many items)
  #delete all lists associated to user when user deleted, also deletes the items associated
  has_many :lists, dependent: :destroy

  #shows list of all items in one giant list if user.items
  has_many :items, through: :lists
end
