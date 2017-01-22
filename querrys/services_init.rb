require 'aws-sdk'
require 'aws-sdk-core'

client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000', region: "us-east-1", access_key_id: 'access_key_id', secret_access_key: 'secret_access_key')

resp = client.batch_write_item({
  request_items: {
    "Services" => [
      {
        put_request: {
          item: {

            "serviceName" => "perf-sparkhybriscluster", 
            "serviceData": {
              "context": {
                "cluster": true,
                "base_dir": "/opt/spark",
                "user": "hybris",
                "user_home": "/home/hybris",
                "accelerator": "b2c",
                "snapshot": {
                  "version": "1.1.20-master",
                  "url": "http://spark:S0Rvc0AhI15pbzc4UnQw@ecsa0040006b.epam.com:8081/artifactory/SPARK/hybris/b2c/snapshot/"
                },
                "platform": {
                  "version": "6200P_1-80002118",
                  "url": "http://epmd-dspk:APyyj1CjkremeHK@ecsa0040006b.epam.com:8081/artifactory/SPARK_MAINTENANCE/hybris/platform/",
                  "checksum": "901043e07e48a75c7a6634b08b7856193ba4eb46a64b18ddde78256e35174af4",
                  "licence": "http://epmd-dspk:APyyj1CjkremeHK@ecsa0040006b.epam.com:8081/artifactory/SPARK_MAINTENANCE/hybris/licence/hybrisServer-Licence.zip"
                }
              },
              "state": "installed",
              "depends_on": [
                "perf-sparkmysql",
                "perf-sparksolrmaster",
                "perf-sparksolrslave",
                "perf-sparklb",
                "perf-sparknfsserver",
                "perf-sparknfsclient",
                "perf-sparkhybrisclustermaster"
              ]
            },
 



          }, 
        }, 
      }, 
    ], 
  }, 
})

puts JSON.pretty_generate(resp.to_h)