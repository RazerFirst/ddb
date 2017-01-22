module Helper
  class MetadataHandler
    
    def self.load_dependencies
      require 'aws-sdk'
      require 'aws-sdk-core'
      require 'json'
    end

    def self.is_table_created?(table_name)
      load_dependencies
    
      client = Aws::DynamoDB::Client.new(endpoint: 'http://dynamodb:8000', region: 'us-east-1', access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

      begin
        resp = client.describe_table({
          table_name: table_name, 
        })
        
        # logger(JSON.pretty_generate(resp.to_h))
        if resp['table']['table_status'] == 'ACTIVE'
          return true
        else
          logger resp['table']['table_status']
          return false
        end
      rescue => e
        puts e
        return false
      end
      
    end

    def self.create_table(table_name, att_name)
      client = Aws::DynamoDB::Client.new(endpoint: 'http://dynamodb:8000', region: 'us-east-1', access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

      resp = client.create_table({
      attribute_definitions: [
        {
            attribute_name: att_name,
            attribute_type: "S",
        },

      ],
        key_schema: [
          {
            attribute_name: att_name,
            key_type: "HASH",
          },

        ],
        provisioned_throughput: {
          read_capacity_units: 5,
          write_capacity_units: 5,
        },
        table_name: table_name,
      })
    end

    def self.init_settings(hostname)
      client = Aws::DynamoDB::Client.new(endpoint: 'http://dynamodb:8000', region: 'us-east-1', access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

      if get_data('Settings', 'version', '0.0.1') != '0.0.1'
        logger 'Table Settings is empty. Initializing...'
        resp = client.batch_write_item({
          request_items: {
            "Settings" => [
              {
                put_request: {
                  item: {
                    "version" => "0.0.1", 
                    "update_interval" => "250", 
                    "context" => {},
                    "generated_for" => hostname,
                  }, 
                }, 
              }, 
            ], 
          }, 
        })
        logger 'Table Settings initialized.'
      end
      # puts JSON.pretty_generate(resp.to_h)
    end

    def self.update_data(table_name, data)

    end

    def self.get_data(table_name, key, value)
      client = Aws::DynamoDB::Client.new(endpoint: 'http://dynamodb:8000', region: 'us-east-1', access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

      resp = client.get_item({
        key: {
           key => value,
        }, 
        table_name: table_name, 
      })
      begin
        response = resp['item'][key]
        logger 'Key \'' + key + '\' contains next value: ' + response
        return response
      rescue Exception => e
        logger 'Value \'' + value + '\' doesn\'t exist in key: ' + key
        return nil
      end
      
      # puts JSON.pretty_generate(resp.to_h)

    end

    def self.generate_metadata
      
    end

    def self.logger(log_string)
      puts "\n" + 'Helper: ' + log_string
      Chef::Log.info('Helper: ' + log_string)
    end
  end
  
end
