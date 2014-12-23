module DataListTable
  module DataListTableHelper
    def table_for(list, params,controller, html_options = {}, &block)
      table = DataListTableTable.new(self,params, controller, html_options)
      block.call(table)
      table.show(list)
      if table.respond_to?('pagination_links')
        table.pagination_links(list)
      end
    end
  end
end