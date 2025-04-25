ActiveAdmin.register BusinessGroup do
  permit_params :name

  filter :name
  filter :created_at

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

  show do |business_group|
    attributes_table do
      row :id
      row :name
      row :created_at

      panel 'Empresas' do
        table_for business_group.companies do
          column :id
          column :name do |company|
            link_to company.name, admin_company_path(company)
          end
        end
      end
    end
    active_admin_comments
  end
end
