module Helper
  class MetadataDependency
    def self.load_dependencies
      require 'aws-sdk'
      require 'aws-sdk-core'
      require 'json'
    end
  end

  class MetadataHandler
    def initialize
      # Instance vars
      @client = Aws::DynamoDB::Client.new(endpoint: 'http://dynamodb:8000', 
                                          region: 'us-east-1', 
                                          access_key_id: 'access_key_id', 
                                          secret_access_key: 'secret_access_key')
    end

    def is_table_created?(table_name)
      begin
        resp = @client.describe_table({
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

    def create_dtable(table_name, att_name)
      resp = @client.create_table({
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

    def init_settings(hostname)
      if get_data('Settings', 'version', '0.0.1') != '0.0.1'
        logger 'Table Settings is empty. Initializing...'
        resp = @client.batch_write_item({
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

    def update_data(table_name, data)

    end

    def get_data(table_name, key, value)
      resp = @client.get_item({
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

    def generate_metadata
      
    end

    def logger(log_string)
      puts "\n" + 'Helper: ' + log_string
      Chef::Log.info('Helper: ' + log_string)
    end
  end
  
end
