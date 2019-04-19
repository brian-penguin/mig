module Mig::Elasticsearch
  class Client
    # This will return the value as text. There is no JSON endpoint
    def indices
      response = get_request(indices_path)
      response
    end

    private

    def get_request(path)
      response = ::Typhoeus.get(path, headers: default_headers)
      if response.code == 200
        response.body
      else
        raise Mig::Elasticsearch::Error.new("Failed to make request to #{path}\nrequest status: #{response.code} \nbody: #{response.body}")
      end
    end

    def default_headers
      {
        "Content-Type" => "application/json",
      }
    end

    def body_headers
      default_headers.merge({
        "Accept" => "application/json",
      })
    end

    def indices_path
      "#{ELASTICSEARCH_ROOT}_cat/indices?v".freeze
    end
  end
end
