module DataListTable
  class DataListTableColumn
    include ActiveSupport::Inflector

    attr_accessor :name, :options

    def initialize(name, options = {})
      @name    = name
      @options = options
    end

    def td_value(item)
      value = options[:td]

      if (value)
        puts value.respond_to?('call')
        puts 'here--------'
        if (value.respond_to?('call'))
          value.call(item)
        else
          value
        end
      else
        item[name]
      end
    end

    def th_value
      options[:th] ||= humanize(name)
    end
  end
  class DataListTableTable
    include ActionView::Helpers::TagHelper

    attr_accessor :template, :columns

    def initialize(temp)
      @columns  = Array.new
      @template = temp
    end

    def col(name, options = {})
      columns << DataListTableColumn.new(name, options)
    end


    def show(list)
      template.content_tag(:table) do
        template.output_buffer << template.content_tag(:tr) do
          columns.collect do |c|
            template.output_buffer << content_tag(:th, c.th_value)
          end
        end
        list.collect do |item|
          template.output_buffer << template.content_tag(:tr) do
            columns.collect do |c|
              template.output_buffer << template.content_tag(:td, c.td_value(item))
            end
          end
        end
      end
    end

  end
end