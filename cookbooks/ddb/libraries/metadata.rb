module Helper
  class MetadataHandler
    
    def self.load_dependencies
      require 'aws-sdk'
      require 'aws-sdk-core'
      require 'json'
    end

    def self.is_table_created?(table_name)
      load_dependencies

      client = Aws::DynamoDB::Client.new(endpoint: 'http://172.17.0.2:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')
    
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

    def self.create_table_settings

    end

    def self.create_table_environments

    end
 
    def self.create_table_nodes

    end

    def self.create_table_services

    end

    def self.init_settings
      
    end

    def self.update_data(table_name, data)

    end

    def self.get_data(table_name, key)

    end

    def self.generate_metadata
      
    end

    def self.logger(log_string)
      puts "\n" + 'Helper: ' + log_string
      Chef::Log.info('Helper: ' + log_string)
    end
  end
  
end
