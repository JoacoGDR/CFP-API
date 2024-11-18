module Request
  module JSONContentType
    def get(path, **params)
      super(path, **params, as: :json)
    end

    def post(*args)
      super(*args, as: :json)
    end

    def update(*args)
      super(*args, as: :json)
    end

    def put(*args)
      super(*args, as: :json)
    end

    def patch(*args)
      super(*args, as: :json)
    end

    def delete(*args)
      super(*args, as: :json)
    end

    def json_args(path, params = {})
      super(path, params.merge(as: :json))
    end
  end
end
