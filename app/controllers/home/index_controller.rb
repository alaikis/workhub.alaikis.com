require_relative '../../erphub/repositories/utils/result_utils'
require_relative '../../erphub/integration/microservices/open_data_api'
require_relative '../../erphub/factories/apis_factory'
class Home::IndexController < ApplicationController
  include Result,ApisFactory
  def index
    # @data = Result::JsonResponse::json_success "the erphub api gateway"
    api = ApisFactory::HotApiFactory.open_standard_api
    data = api.get_country_list
    puts data
    render json: JsonResponse.json_success( data)
  end
end
