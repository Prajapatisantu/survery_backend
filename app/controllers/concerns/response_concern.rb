module ResponseConcern
  extend ActiveSupport::Concern

  HTTP_SUCCESS = 200
  HTTP_UNPROCESSABLE_ENTITY = 422
  HTTP_NOT_FOUND = 404


  def success(data: [], msg: '')
    render json: {
      result: data,
      message: msg,
      code: HTTP_SUCCESS
    }
  end

  def error(data: [], msg: '')
    render json: {
      result: data,
      message: msg,
      code: HTTP_UNPROCESSABLE_ENTITY
    }
  end

  def not_found(data: [], msg: '')
    render json: {
      result: data,
      message: msg,
      code: HTTP_NOT_FOUND
    }
  end
  
  
end