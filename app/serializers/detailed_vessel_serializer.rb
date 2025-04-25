class DetailedVesselSerializer < ActiveModel::Serializer
  attributes :id, :registration_code, :name, :company

  belongs_to :company, serializer: CompanySerializer

  has_many :vessel_name_changes
  has_many :vessel_ownership_changes
  has_many :catch_quotas
  has_many :catches
end
