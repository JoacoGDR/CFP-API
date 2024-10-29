module Pagination
  private

  DEFAULT_PAGE_SIZE = 10

  def render_paginated(collection, serializer: nil, root_key: nil, meta_data: {})
    paginated_collection = paginate_collection(collection)
    render json: paginated_collection, adapter: :json, status: :ok,
           each_serializer: serializer, root: root_key, meta: meta_data,
           meta_key: :meta_data
  end

  def paginate_collection(collection)
    collection.page(params[:page]).per(page_size)
  end

  def page_size
    return params[:per_page] if params[:per_page].present?

    DEFAULT_PAGE_SIZE
  end
end
