module OrderHandler
  private

  def valid_sort_order?
    %w(asc desc).include?(params[:order])
  end

  def order_column
    params[:sort].to_s
  end
end