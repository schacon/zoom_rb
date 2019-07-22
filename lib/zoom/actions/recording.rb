# frozen_string_literal: true

module Zoom
  module Actions
    module Recording
      def recording_list(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:host_id], options)
        Utils.process_datetime_params!(%i[from to], options)
        Utils.parse_response self.class.get("/meetings/#{options[:host_id]}/recordings",  headers: request_headers)
      end

      def recording_get(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:meeting_id], options)
        Utils.parse_response self.class.post('/recording/get', query: options)
      end

      def recording_delete(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:meeting_id], options)
        Utils.parse_response self.class.post('/recording/delete', query: options)
      end
    end
  end
end
