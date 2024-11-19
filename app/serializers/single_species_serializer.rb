class SingleSpeciesSerializer < ActiveModel::Serializer
  attributes :id, :name, :catch_quota_allocations, :catch_quotas, :catches
end
