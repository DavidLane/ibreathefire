class Video < ActiveRecord::Base
  #extend FriendlyId
  
  #acts_as_voteable
  
  # belongs_to :user
  belongs_to :event
  attr_accessible :description, :title, :url, :user_id, :date, :youtube_id, :event_id
  attr_accessible :description, :title, :url, :user_id, :date, :slug, :is_featured, :event_id, :as => :admin
  
  # Match non-linked youtube URL in the wild. (Rev:20111012)
  @@youtube_regex = /https?:\/\/(?:[0-9A-z-]+\.)?(?:youtu\.be\/|youtube\.com\S*[^\w\-\s])([\w\-]{11})(?=[^\w\-]|$)/
  
  validates_format_of :url, :with => @@youtube_regex, :message => "must be a valid Youtube URL"
  validates_format_of :slug, :with => /^[\w\-]+$/, :message => "must be a valid slug"
  validates_presence_of :title, :url, :slug

  #friendly_id :title, use: :slugged
  
  before_save :get_youtube_id_from_url
  
  scope :featured, where(:is_featured => true)
  scope :timeline, order("date DESC")
  #scope :top_rated, tally(:order => "vote_count DESC")
  scope :newest, order("created_at DESC")
  
  def belongs_to_current_user(current_user)
  	if self.user == current_user
  		return true
  	end
  end

  # This needs to regex out the ID from youtube
  def get_youtube_uri
    if self.url
      @@uri = self.url.split('v=').last
      return @@uri
	  else
      return false
	  end
  end

  def get_youtube_thumbnail
    return "http://img.youtube.com/vi/#{self.youtube_id}/hqdefault.jpg"
  end
  
  def get_youtube_id_from_url
    id = self.url.match(@@youtube_regex).captures
    self.youtube_id = id.first
  end

end
