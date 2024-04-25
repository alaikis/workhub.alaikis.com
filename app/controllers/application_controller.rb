require_relative '../erphub/repositories/utils/result_utils'
class ApplicationController < ActionController::API
  include Result

  def render_not_found(exception = nil)
    render Result::JsonResponse::json_error "can not find the resource",404
  end
end
