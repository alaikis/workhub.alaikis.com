# frozen_string_literal: true
require_relative '../../erphub/integration/microservices/open_data_api'
require 'json'
module ApisFactory
  class HotApiFactory
    #open standard api service
    def self.open_standard_api
      config = Setting.where(name: 'stdapi',usage:"api",space:"interface").last
      config_value = JSON.parse config.value
      OpenDataApi.new config_value["key"],config_value["secret"]
    end
  end
end