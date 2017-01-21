#
# Cookbook:: ddb
# Recipe:: default
#

chef_gem 'aws-sdk' do
  version '2.6.49'
  action :nothing
end.run_action(:install)

puts '=============================================++++++++++==============='


node['ddb']['tables'].each do |table, att_name|
  if Helper::MetadataHandler.is_table_created?(table)
    Helper::MetadataHandler.logger('Table ' + table + ' already exist.')
  else
    Helper::MetadataHandler.logger('Table ' + table + ' does not exist.')
    Helper::MetadataHandler.logger('Creating table ' + table + ' ...')
    Helper::MetadataHandler.create_table(table, att_name)
    Helper::MetadataHandler.logger('Table ' + table + ' has been created.')
  end
end

