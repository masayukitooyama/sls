module Response
  def success(data)
    render json: {
      status: "success",
      data: data
    }, status: 200
  end

  def error(errors, status)
    render json: {
      status: "error",
      errors: errors
    }, status: status
  end
end
