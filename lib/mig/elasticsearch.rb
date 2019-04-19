require "mig/elasticsearch/client"
require "typhoeus"

module Mig::Elasticsearch
  ELASTICSEARCH_ROOT = "http://localhost:9200/".freeze

  class Error < StandardError; end
end
