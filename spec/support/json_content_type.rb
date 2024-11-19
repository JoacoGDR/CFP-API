module Request
  module JSONContentType
    def get(path, **params)
      super(path, **params, as: :json)
    end

    def post(path, **params)
      super(path, **params, as: :json)
    end

    def update(path, **params)
      super(path, **params, as: :json)
    end

    def put(path, **params)
      super(path, **params, as: :json)
    end

    def patch(path, **params)
      super(path, **params, as: :json)
    end

    def delete(path, **params)
      super(path, **params, as: :json)
    end

    def json_args(path, params = {})
      super(path, params.merge(as: :json))
    end
  end
end
