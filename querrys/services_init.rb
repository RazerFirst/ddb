require 'aws-sdk'
require 'aws-sdk-core'

client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

resp = client.batch_write_item({
  request_items: {
    "Services" => [
      {
        put_request: {
          item: {
            "serviceName" => "perf-sparksolrslave",
            "serviceData": {"port": "8983",
              "context": {
                "src": "http://spark:S0Rvc0AhI15pbzc4UnQw@ecsa0040006b.epam.com:8081/artifactory/SPARK/tools/solr/5.3/solr.tar.gz",
                "src_chksum": "b1a4ef0a268f44613603db9deb65c69ed8b7dca9d23922da0988e9aa5ce30bd3",
                "base_dir": "/opt/spark",
                "init_name": "solrslave"
              },
              "state": "installed",
              "depends_on": [
                "perf-sparksolrmaster"
              ]},
          }, 
        }, 
      }, 
    ], 
  }, 
})

puts JSON.pretty_generate(resp.to_h)