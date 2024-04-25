require 'logger'
require 'digest'
require 'openssl'
require 'base64'
require 'json'
require 'httpclient'
class HotBaseApi
  @@api=""
  @@version=""
  @@auth_type= ""
  @@auth_type_name = ""
  @@content_type="application/json"
  @@biz_content = ""
  def initialize(key,secret)
    @key = key
    @secret = secret
  end
  #生成签名
  def make_sign(params)
    digest = OpenSSL::Digest.new('sha256')
    sign_string = params.sort.map{|k,v| "#{k}=#{v}"}.join("&")
    sign_origin = OpenSSL::HMAC.hexdigest(digest, @secret, sign_string)
    Base64.encode64 sign_origin
  end
  private :make_sign
  def make_request(endpoint,data={},request_method = "POST")
    request_api_url = "#{@@api}#{@@version!="" ? "/" : ""}#{@@version}#{endpoint}"
    if data != nil
      data = {}
    end
    if @@biz_content != ""
      param = {}

      param[@@biz_content] = data
      param["key"] = @key
      param["appId"] = @key
      param["timestamp"] = Time.now.to_i
      param["version"] = @@version
      param["sign_method"] = "hmac_sha256"
    else
      param = data
    end
    token = @secret
    if @@auth_type!=""
      token = self.send(@@auth_type,param)
      Rails.logger.info token
    end
    auth_string = "#{@@auth_type_name}#{@@auth_type_name!="" ? " " : ""}#{token}"
    header = {}
    header["Authorization"] = auth_string
    if @@content_type!=""
      header["Content-Type"] = @@content_type
    end
    if request_method.upcase == "GET"
      request_api_url = "#{request_api_url}?#{URI.encode_www_form param}"
    end
    Rails.logger.info request_api_url
    api = URI.parse request_api_url
    http = HTTPClient.new
    @res = http.request request_method,request_api_url,param
    JSON.parse @res.body
  end

end
