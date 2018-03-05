# using HTTParty gem

# code sample.
# should separate these classes to files.
module APIServices
  module ServerXYZ
    class Base
      include HTTParty
      base_uri ENV['XYZ_API_URL']
      headers 'API-TOKEN' => ENV['XYZ_API_TOKEN']

      def initialize
        self.class.default_params
        self.class.headers(default_headers)
      end

      def fetch(_options = {})
        fail NotImplementedError
      end

      def options
        Hash(body)
      end

      def body
        {}
      end

      def default_headers
        {
            'Accept' => 'application/json'
        }
      end
    end

    class Agents < Base
      URI = '/agents'.freeze

      def initialize(params)
        super()
        @params = params
      end

      def fetch
        JSON.parse(
            self.class.get("#{URI}", options).body,
            symbolize_names: true
        )
      end

      def body
        {
            body: {
                port_name: @params[:port_name],
                page: @params[:page]
            }
        }
      end
    end

    class VesselParticulars < Base
      URI = '/vessel_particulars'.freeze

      def initialize(params)
        super()
        @params = params
      end

      def fetch
        JSON.parse(
            self.class.get("#{URI}", options).body,
            symbolize_names: true
        )
      end

      def body
        {
            body: {
                page: @params[:page]
            }
        }
      end
    end

    class VesselSchedules < Base
      URI = '/vessel_schedules'.freeze

      def initialize(params)
        super()
        @params = params
      end

      def fetch
        JSON.parse(
            self.class.get("#{URI}", options).body,
            symbolize_names: true
        )
      end

      def body
        {
            body: {
                vessel_name: @params[:vessel_name],
                vessel_month: @params[:vessel_month],
                page: @params[:page]
            }
        }
      end
    end
  end
end
