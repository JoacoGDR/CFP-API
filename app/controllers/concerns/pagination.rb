module Pagination
  private

  DEFAULT_PAGE_SIZE = CredentialsHelper.fetch_secret(:default_page_size, default: 10)

  def render_paginated(collection, serializer: nil, root_key: nil, meta_data: {})
    paginated_collection = paginate_collection(collection)
    render json: paginated_collection, adapter: :json, status: :ok,
           each_serializer: serializer, root: root_key,
           meta: paginated_index_meta_information(paginated_collection).merge(meta_data),
           meta_key: :meta_data
  end

  def paginated_index_meta_information(collection)
    {
      pages_information: {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    }
  end

  def paginate_collection(collection)
    collection.page(params[:page]).per(page_size)
  end

  def page_size
    return params[:page_size] if params[:page_size].present?

    DEFAULT_PAGE_SIZE
  end
end
