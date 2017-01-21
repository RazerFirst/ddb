require 'aws-sdk'
require 'aws-sdk-core'

client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

resp = client.batch_write_item({
  request_items: {
    "Settings" => [
      {
        put_request: {
          item: {
            "version" => "0.0.1", 

            "update_interval" => "250", 

            "context" => {},
          }, 
        }, 
      }, 
    ], 
  }, 
})

puts JSON.pretty_generate(resp.to_h)