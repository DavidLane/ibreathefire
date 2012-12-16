class Report < ActiveRecord::Base
  attr_accessible :reason, :user_id, :video_id
end
