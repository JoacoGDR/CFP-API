module OrderHandler
  private

  def ordered_collection(collection)
    return collection unless valid_order_params?

    collection.order(order_by_param => order_param)
  end

  def valid_order_params?
    return true if order_by_param.blank?

    valid_order_param? && valid_order_by_param?
  end

  def valid_order_param?
    return true if order_param.blank?

    %w[asc desc].include?(order_param)
  end

  def valid_order_by_param?
    order_attributes.include?(order_by_param)
  end

  def order_param
    params[:order]
  end

  def order_by_param
    params[:order_by]
  end

  def order_params_errors
    render_error('Invalid order parameters', status: :bad_request)
  end
end
