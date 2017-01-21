action :init do

	new_resource.tables.each do |table|
	  if Helper::MetadataHandler.is_table_created?(table)
	    Helper::MetadataHandler.logger('Table ' + table + ' already exist')
	  end
  end
end