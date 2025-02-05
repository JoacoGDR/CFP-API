ActiveAdmin.register Vessel do
  permit_params :registration_code, :name, :company_id
  filter :name
  filter :registration_code
  filter :company
  filter :created_at

  index do
    selectable_column
    id_column
    column :registration_code
    column :name
    column :company
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :registration_code
      f.input :name
      f.input :company
    end
    f.actions
  end

  show do |vessel|
    attributes_table do
      row :id
      row :registration_code
      row :name
      row :company
      row :created_at
      row :updated_at

      panel 'Asignaciones de cuotas' do
        table_for vessel.catch_quota_allocations do
          column :id
          column :species
          column :amount
          column :start_date
        end
      end

      panel 'Cuotas de captura' do
        table_for vessel.catch_quotas do
          column :id
          column :quota
          column :species
          column :start_date
        end
      end

      panel 'Cambios de nombre' do
        table_for vessel.vessel_name_changes do
          column :previous_name
          column :new_name
          column :change_date
        end
      end

      panel 'Cambios de propiedad' do
        table_for vessel.vessel_ownership_changes do
          column :previous_owner
          column :new_owner
          column :change_date
        end
      end

    end
    active_admin_comments
  end
end