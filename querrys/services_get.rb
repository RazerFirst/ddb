require 'aws-sdk'
require 'aws-sdk-core'
require 'json'

client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

# resp = client.batch_get_item({
#   request_items: {
#     "Services" => {
#       keys: [
#         {
#           "serviceName" => "perf-sparksolrslave",
#         }, 
        
#       ], 
      
#     }, 
#   }, 
# })

# puts resp.to_h


# puts JSON.pretty_generate(resp.to_h)

# puts "============================================="

# resp = client.get_item({
#   key: {
#      "serviceName" => "perf-sparksolrslave",
#   }, 
#   table_name: "Services", 
# })

# puts JSON.pretty_generate(resp.to_h)

puts "============================================="

# resp = client.scan({
#   expression_attribute_names: {
#     "AT" => "serviceName", 
#     "ST" => "serviceData", 
#   }, 
#   expression_attribute_values: {
#     ":a" => {
#       s: "No One You Know", 
#     }, 
#   }, 
#   filter_expression: "serviceName = :a", 
#   projection_expression: "#ST, #AT", 
#   table_name: "Services", 
# })
resp = client.scan :table_name => "Services"

puts JSON.pretty_generate(resp.to_h)