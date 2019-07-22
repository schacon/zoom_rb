# frozen_string_literal: true

module Zoom
  module Actions
    module Recording
      def recording_list(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:user_id], options)
        Utils.process_datetime_params!(%i[from to], options)
        Utils.parse_response self.class.get("/users/#{options[:user_id]}/recordings",  query: options, headers: request_headers)
      end

      def recording_get(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:meeting_id], options)
        Utils.parse_response self.class.get("/meetings/#{options[:meeting_id]}/recordings", query: options, headers: request_headers)
      end
    end
  end
end
