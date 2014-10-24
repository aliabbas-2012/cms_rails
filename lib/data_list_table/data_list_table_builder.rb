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
  #Data Table lIST
  class DataListTableTable
    include ActionView::Helpers::TagHelper

    attr_accessor :template, :columns, :html_options, :controller

    def initialize(temp, controller, html_options = {})
      @columns = Array.new
      @template = temp
      @html_options = html_options
      if defined?(WillPaginate)

      end
      @controller = controller
    end

    def col(name, options = {})
      columns << DataListTableColumn.new(name, options)
    end

    if defined?(WillPaginate)
      include WillPaginate::ViewHelpers
      include Rails.application.routes.url_helpers

      def pagination_links(collection, options = {})

        options[:renderer] ||= BootstrapPagination::Rails
        options[:class] ||= 'pagination pagination-centered'
        options[:inner_window] ||= 2
        options[:outer_window] ||= 1
        options[:params] = {:controller => controller.controller_name, :action => controller.action_name}
        will_paginate(collection, options)
      end
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
    end

  end

end