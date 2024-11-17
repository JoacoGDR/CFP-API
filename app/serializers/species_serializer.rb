class SpeciesSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_quotated?

  def is_quotated?
    object.catch_quotas.any?
  end
end
