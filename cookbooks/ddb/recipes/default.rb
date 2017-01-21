#
# Cookbook:: ddb
# Recipe:: default
#

chef_gem 'aws-sdk' do
  version '2.6.49'
  action :nothing
end.run_action(:install)

puts '=============================================++++++++++==============='


ddb_tables 'init' do
  tables ['Settings', 'Nodes', 'Environments', 'Services']
  action :init
#  not_if { "`/opt/chef/embedded/bin/gem list | grep aws-sdk1 || echo $?`" == '1' }
end

# Copyright:: 2017, The Authors, All Rights Reserved.
# module Helper
#    class MetadataHandler
#      class << self
#        def load_dependencies
#         require 'aws-sdk'
#         require 'aws-sdk-core'
#         require 'json'
#        end

#        def my_chef_gem bar
#            MetadataHandler.load_dependencies
#            MyGem::do_the_thing_with_the_bar bar
#        end
#      end
#    end
# end