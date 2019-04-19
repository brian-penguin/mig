module Mig::Elasticsearch
  class Client
    # This will return the value as text. There is no JSON endpoint
    def indices
      response = get_request(indices_path)
      response.body
    end

    private

    def get_request(path)
      ::Typhoeus.get(path, headers: default_headers)
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
