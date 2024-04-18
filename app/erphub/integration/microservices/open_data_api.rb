# frozen_string_literal: true
require_relative 'hot_base_api'
class OpenDataApi < HotBaseApi
  @@api="https://api.hottol.com/op"
  @@version=""
  @@auth_type= "make_sign"
  @@auth_type_name = "Token"
  @@content_type=""
  @@biz_content = "bizContent"
  def get_country_list
    make_request "/open/country/list",{},"GET"
  end
end
