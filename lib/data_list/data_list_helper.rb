module DataList
  module DataListHelper
    def data_listing_for(collection)
      collection.each do |object|
        yield(DataListBuilder.new(object)) if block_given?
      end
      ''
    end

    def list_view(collection,attributes)
      yield(DataListBuilder.new(collection,attributes)) if block_given?
      ''
    end
  end
end