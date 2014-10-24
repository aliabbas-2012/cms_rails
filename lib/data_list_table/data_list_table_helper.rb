module DataListTable
  module DataListTableHelper
    def table_for(list, html_options = {}, &block)
      table = DataListTableTable.new(self, html_options)
      block.call(table)
      table.show(list)
    end
  end
end