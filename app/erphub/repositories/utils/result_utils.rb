# frozen_string_literal: true

module Result
  class JsonResponse
    class << self
      def json_success(data)
        {
          code: 200,
          data: data,
          timestamp: Time.now.to_i,
          msgId: Random.uuid,
          error: [],
          ok: 1
        }
      end
      def json_error(errors,code=406)
        {
          code: code,
          data: nil,
          timestamp: Time.now.to_i,
          msgId: Random.uuid,
          error: errors.is_a?(Array)? errors : [errors],
          ok: 0
        }
      end
    end
  end
end
