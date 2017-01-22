{
  "generated_for": "ecsa0040013f.epam.com",
  "update_interval": "250",
  "version": "0.0.1",
  "context": {
  },
  "environments": {
    "perf": {
      "context": {
      },
      "nodes": {
        "ecsa0040013f.epam.com": {
          "context": {
          },
          "services": {
            "sparkdynatrace_server": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkhybris"
              ]
            },
            "sparkdynatrace_collector": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkdynatrace_server"
              ]
            },
            "sparkdynatrace_warehouse": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkdynatrace_server"
              ]
            }
          }
        },
        "ecsa00400139.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparknfsclient": {
              "context": {
              },
              "state": "ready",
              "depends_on": [
                "perf-sparknfsserver"
              ]
            },
            "perf-sparkhybriscluster": {
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
            "sparkzabbixagent": {
              "state": "unknown",
              "context": {
              },
              "depends_on": [
                "sparkzabbixserver",
                "perf-sparkmysql"
              ]
            }
          }
        },
        "ecsa00400137.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparkmysql": {
              "port": "3306",
              "context": {
                "instance": "spark",
                "root_pass": "LKJnk3542390jMJhoipjmrg",
                "user": "b2c",
                "user_pass": "b2c",
                "db": "perf_b2c",
                "databases": {
                  "sparksonar": false
                }
              },
              "state": "installed"
            },
            "perf-sparknfsserver": {
              "context": {
                "export_dir": "/opt/spark/hybris/data/media"
              },
              "state": "installed",
              "depends_on": [
                "perf-sparknfsclient"
              ]
            }
          }
        },
        "ecsa0040013b.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparksolrmaster": {
              "port": 8983,
              "context": {
                "src": "http://spark:S0Rvc0AhI15pbzc4UnQw@ecsa0040006b.epam.com:8081/artifactory/SPARK/tools/solr/5.3/solr.tar.gz",
                "src_chksum": "b1a4ef0a268f44613603db9deb65c69ed8b7dca9d23922da0988e9aa5ce30bd3",
                "base_dir": "/opt/spark",
                "init_name": "solrmaster"
              },
              "state": "installed",
              "depends_on": [

              ]
            },
            "sparkzabbixagent": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkzabbixserver",
                "perf-sparkmysql"
              ]
            }
          }
        },
        "": {
          "context": {
          },
          "services": {
            "sparkzabbixserver": {
              "context": {
                "sparkzabbix": {
                  "user": "Admin",
                  "pass": "zabbix"
                }
              },
              "state": "installed",
              "depends_on": [

              ]
            },
            "sparkzabbixagent": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkzabbixserver",
                "perf-sparkmysql"
              ]
            }
          }
        },
        "ecsa0040013d.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparklb": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "perf-sparkhybriscluster"
              ]
            }
          }
        },
        "ecsa00400162.epam.com": {
          "context": {
          },
          "services": {
            "sparkzabbixserver": {
              "context": {
                "sparkzabbix": {
                  "user": "Admin",
                  "pass": "zabbix"
                }
              },
              "state": "installed",
              "depends_on": [

              ]
            },
            "sparkzabbixagent": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkzabbixserver",
                "perf-sparkmysql"
              ]
            }
          }
        },
        "ecsa0040015b.epam.com": {
          "context": {
          },
          "services": {
            "sparkjmeter": {
              "context": {
              },
              "state": "installed"
            }
          }
        },
        "ecsa0040015c.epam.com": {
          "context": {
          },
          "services": {
            "sparkjmeter": {
              "context": {
              },
              "state": "installed"
            }
          }
        },
        "ecsa0040013c.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparksolrslave": {
              "port": 8983,
              "context": {
                "src": "http://spark:S0Rvc0AhI15pbzc4UnQw@ecsa0040006b.epam.com:8081/artifactory/SPARK/tools/solr/5.3/solr.tar.gz",
                "src_chksum": "b1a4ef0a268f44613603db9deb65c69ed8b7dca9d23922da0988e9aa5ce30bd3",
                "base_dir": "/opt/spark",
                "init_name": "solrslave"
              },
              "state": "installed",
              "depends_on": [
                "perf-sparksolrmaster"
              ]
            },
            "sparkzabbixagent": {
              "context": {
              },
              "state": "installed",
              "depends_on": [
                "sparkzabbixserver",
                "perf-sparkmysql"
              ]
            }
          }
        },
        "ecsa00400150.epam.com": {
          "context": {
          },
          "services": {
            "perf-sparknfsclient": {
              "context": {
              },
              "state": "ready",
              "depends_on": [
                "perf-sparknfsserver"
              ]
            },
            "perf-sparkhybrisclustermaster": {
              "context": {
                "cluster": true,
                "master": true,
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
              "state": "ready",
              "depends_on": [
                "perf-sparkmysql",
                "perf-sparksolrmaster",
                "perf-sparksolrslave",
                "perf-sparklb",
                "perf-sparknfsserver",
                "perf-sparknfsclient"
              ]
            }
          }
        }
      }
    }
  }
}