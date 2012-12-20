ActiveAdmin.register Video, :as => "Featured Video" do
  scope :featured, :default => true
  controller {
  	with_role :admin
  }  
end

ActiveAdmin.register Video do
  controller {
  	with_role :admin
  }  
end