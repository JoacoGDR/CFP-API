class SpeciesSerializer < ActiveModel::Serializer
  attributes :id, :name, :quotated?

  def quotated?
    object.catch_quotas.any?
  end
end
