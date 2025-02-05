class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :business_group, serializer: BusinessGroupSerializer
end