class InboundTransferSerializer < ActiveModel::Serializer
  attributes :id, :amount, :detail, :date, :source

  private

  def source
    {
      source: {
        id: object.source_quota.owner_id,
        type: object.source_quota.owner_type
      }
    }
  end
end
