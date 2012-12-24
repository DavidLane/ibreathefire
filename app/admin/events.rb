ActiveAdmin.register Event do
  controller {
  	with_role :admin
  }    
  
  form :html => { :enctype => "multipart/form-data" } do |f|
 	f.inputs "Details" do
      f.input :title
      f.input :description    
      f.input :slug
      f.input :banner, :as => :file
      f.input :is_approved
    end
    f.buttons 
  end
end
