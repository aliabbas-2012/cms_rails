module DataList
  class DataListBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def initialize(object, attributes = nil)
      @object = object
      @attributes = attributes
    end

    def heading(attribute, options={})
      unless DataList.heading_tag.nil?
        content_tag DataList.heading_tag, output_for_attribute(attribute), options
      end
    end

    def subheading(attribute, options={})
      unless DataList.subheading_tag.nil?
        content_tag DataList.subheading_tag, output_for_attribute(attribute), options
      end
    end

    def text(attribute, options={})
      unless DataList.text_tag.nil?
        content_tag DataList.text_tag, output_for_attribute(attribute), options
      end
    end

    # list view in table
    def list_view_header()
      attributes = @attributes
      content_tag(:table) do
        content_tag (:thead) do
          content_tag(:tr) do
            attributes.map do |k, attribute|
              content_tag (:th) do
                attribute
              end
            end.join.html_safe
          end
        end
      end
    end

    protected
    def output_for_attribute(attribute)

      if attribute.is_a? Symbol
        @object.send attribute
      elsif attribute.is_a? String
        @object.send attribute.to_sym
      elsif attribute.is_a? Proc
        attribute.call(@object)
      else
        raise ArgumentError.new("#{attribute.class} type parameters are not supported by DataList")
      end
    end
  end
end