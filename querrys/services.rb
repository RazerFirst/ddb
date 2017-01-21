require 'aws-sdk'
require 'aws-sdk-core'


dynamo_db = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

resp = dynamo_db.create_table({
  attribute_definitions: [
    {
        attribute_name: "serviceName",
        attribute_type: "S",
    },

  ],
    key_schema: [
      {
        attribute_name: "serviceName",
        key_type: "HASH",
      },

    ],
    provisioned_throughput: {
      read_capacity_units: 5,
      write_capacity_units: 5,
    },
    table_name: "Services",
  })

puts JSON.pretty_generate(resp.to_h)
puts "LOL"