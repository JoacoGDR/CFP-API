class OutboundTransferSerializer < ActiveModel::Serializer
  attributes :id, :amount, :detail, :date, :target

  private

  def target
    {
      target: {
        id: object.target_quota.owner_id,
        type: object.target_quota.owner_type
      }
    }
  end
end
