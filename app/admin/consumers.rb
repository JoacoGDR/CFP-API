ActiveAdmin.register Consumer do
  filter :name
  filter :created_at

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do |consumer|
    attributes_table do
      row :id
      row :name
      row :api_key
      row :api_secret
      row :created_at
    end
    active_admin_comments
  end
end
