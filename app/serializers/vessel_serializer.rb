class VesselSerializer < ActiveModel::Serializer
  attributes :id, :registration_code, :name
  belongs_to :company, serializer: CompanySerializer
  has_one :business_group, through: :company, serializer: BusinessGroupSerializer
end
