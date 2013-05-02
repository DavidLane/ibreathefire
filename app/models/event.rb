class Event < ActiveRecord::Base
  #extend FriendlyId
 
  has_many :videos
  attr_accessible :description, :title, :slug, :is_approved, :banner, :as => :admin
  attr_accessible :title, :banner
  has_attached_file :banner, :styles => {:banner => "940x350", :thumbnail => "460x258"}
  
  #friendly_id :title, use: :slugged
  
  scope :approved, where(:is_approved => true)
end
