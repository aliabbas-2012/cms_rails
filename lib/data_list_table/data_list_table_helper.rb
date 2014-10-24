module DataListTable
  module DataListTableHelper
    def table_for(list, &block)
      table = DataListTableTable.new(self)
      block.call(table)
      table.show(list)
    end
  end
end