module DataList
  module DataListHelper
    def data_listing_for(collection)
      collection.each do |object|
        yield(DataListBuilder.new(object)) if block_given?
      end
      ''
    end
  end
end