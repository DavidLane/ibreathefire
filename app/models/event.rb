class Event < ActiveRecord::Base
  extend FriendlyId
  
  has_many :videos
  attr_accessible :description, :title, :slug, :as => :admin
  
  friendly_id :title, use: :slugged
end
