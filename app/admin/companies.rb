ActiveAdmin.register Company do
  permit_params :name, :address, :phone, :email, :contact_person

  filter :name
  filter :created_at
  filter :business_group

  index do
    selectable_column
    id_column
    column :name
    column :business_group do |company|
      unless company.business_group.nil?
        link_to company.business_group.name, admin_business_group_path(company.business_group)
      end
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :business_group
    end
    f.actions
  end

  show do |company|
    attributes_table do
      row :id
      row :name
      row :created_at
      row :business_group

      panel 'Buques' do
        table_for company.vessels do
          column :id
          column :registration_code
          column :name
        end
      end

      panel 'Adquisiciones de buques' do
        table_for company.vessel_acquisitions do
          column :previous_owner
          column :change_date
        end
      end

      panel 'Dispocisiones de buques' do
        table_for company.vessel_disposals do
          column :new_owner
          column :change_date
        end
      end
    end
    active_admin_comments
  end
end