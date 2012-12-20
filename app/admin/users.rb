ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
  end

  filter :email

  controller { with_role :admin }  
end
