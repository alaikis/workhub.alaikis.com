require_relative '../../erphub/repositories/utils/result_utils.rb'
class Home::IndexController < ApplicationController
  include Result
  def index
    @data = Result::JsonResponse::json_success "the erphub api gateway"
    render json: @data
  end
end
