module DataList
  mattr_accessor :heading_tag, :subheading_tag, :text_tag
end

require 'data_list/data_list_builder'
require 'data_list/data_list_helper'

ActiveSupport.on_load(:action_view) do
  include DataList::DataListHelper
end