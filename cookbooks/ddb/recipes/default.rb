#
# Cookbook:: ddb
# Recipe:: default
#

chef_gem 'aws-sdk' do
  version '2.7'
  action :nothing
end.run_action(:install)

Helper::MetadataDependency.load_dependencies

handler = Helper::MetadataHandler.new

puts '=============================================++++++++++==============='

# node['ddb']['tables'].each do |table, att_name|
#   if Helper::MetadataHandler.is_table_created?(table)
#     Helper::MetadataHandler.logger('Table ' + table + ' already exist.')
#   else
#     Helper::MetadataHandler.logger('Table ' + table + ' does not exist.')
#     Helper::MetadataHandler.logger('Creating table ' + table + ' ...')
#     Helper::MetadataHandler.create_table(table, att_name)
#     Helper::MetadataHandler.logger('Table ' + table + ' has been created.')
#   end
# end

# Helper::MetadataHandler.init_settings(node['hostname'])

node['ddb']['tables'].each do |table, att_name|
  if handler.is_table_created?(table)
    handler.logger('Table ' + table + ' already exist.')
  else
    handler.logger('Table ' + table + ' does not exist.')
    handler.logger('Creating table ' + table + ' ...')
    handler.create_dtable(table, att_name)
    handler.logger('Table ' + table + ' has been created.')
  end
end

handler.init_settings(node['hostname'])

