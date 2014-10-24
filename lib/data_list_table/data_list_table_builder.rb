module DataListTable
  class DataListTableColumn
    include ActiveSupport::Inflector


    attr_accessor :name, :options

    def initialize(name, options = {})
      @name = name
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
    include WillPaginate::ViewHelpers
    include ActionView::Helpers::UrlHelper
    include Rails.application.routes.url_helpers


    attr_accessor :template, :columns, :html_options, :controller

    def initialize(temp, html_options = {})
      @columns = Array.new
      @template = temp
      @html_options = html_options
    end

    def col(name, options = {})
      columns << DataListTableColumn.new(name, options)
    end


    def show(list)
      template.content_tag(:table, html_options) do
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
      #template.output_buffer << will_paginate(list, renderer: BootstrapPagination::Rails)
    end

  end
end