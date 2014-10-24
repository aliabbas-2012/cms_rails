module DataListTable
  mattr_accessor :test
end

require 'data_list_table/data_list_table_builder'
require 'data_list_table/data_list_table_helper'

ActiveSupport.on_load(:action_view) do
  include DataListTable::DataListTableHelper
end