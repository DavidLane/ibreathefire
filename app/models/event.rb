class Event < ActiveRecord::Base
  extend FriendlyId
  
  has_many :videos
  attr_accessible :description, :title, :slug, :is_approved, :as => :admin
  attr_accessible :title  
  
  friendly_id :title, use: :slugged
  
  scope :approved, where(:is_approved => true)
end
