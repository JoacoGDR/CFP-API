ActiveAdmin.register Species do
  permit_params :name
  # filter :by_quotated_status, as: :select, collection: Species.by_quotated_status :all

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do |species|
    attributes_table do
      row :id
      row :name

      panel 'Asignaciones de cuotas' do
        table_for species.catch_quotas.non_expired do
          column :id
          column :quota
          column :owner do |quota|
            if quota.owner_type == 'Vessel'
              link_to quota.owner.name, admin_vessel_path(quota.owner)
            else
              quota.owner_type
              link_to quota.owner.name, admin_public_entity_path(quota.owner)
            end
          end
        end
      end
    end
    active_admin_comments
  end
end
