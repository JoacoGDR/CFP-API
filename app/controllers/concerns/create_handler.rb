module CreateHandler
  private

  def render_created_message(new_model)
    render json: { message: "#{new_model.class_name} successfully created",
                   url: model_url(new_model.class_name)
                 },
           status: :created
  end

  def model_url(model_name)
    url_helpers.send("#{model_name}_url", new_model)
  end
end