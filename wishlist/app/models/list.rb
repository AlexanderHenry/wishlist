class List < ActiveRecord::Base
	validates_presence_of :name, :on => :create, :message => "can't be blank"
	validates_presence_of :description, :on => :create, :message => "can't be blank"
	
	#rails guides, active record associations
	has_many :items, dependent: :destroy
	belongs_to :user
end
