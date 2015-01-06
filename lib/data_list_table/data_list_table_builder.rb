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

  class DataListTableActionColumn
    include ActiveSupport::Inflector

    attr_accessor :name, :actions, :options

    def initialize(name, actions={}, options = {})
      @name = name
      @actions = actions
      @options = options
    end

    def th_value
      options[:th] ||= humanize(name)
    end

  end

  #Data Table lIST
  class DataListTableTable
    include ActionView::Helpers::TagHelper

    attr_accessor :template, :columns, :html_options, :controller, :params, :action_column

    def initialize(temp, params, controller, html_options = {})
      @columns = Array.new
      @template = temp
      @html_options = html_options
      @params = params
      @action_column = Array.new
      if defined?(WillPaginate)

      end
      @controller = controller
    end


    def col(name, options = {})
      columns << DataListTableColumn.new(name, options)
    end

    def action_col(name, actions, options = {})
      action_column[0] = DataListTableActionColumn.new(name, actions, options)
    end

    if defined?(WillPaginate)
      include WillPaginate::ViewHelpers
      include ActionView::Helpers::UrlHelper
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

      template.output_buffer << template.content_tag(:table, html_options) do
        #preparing header row
        template.output_buffer << template.content_tag(:thead) do
          template.output_buffer << template.content_tag(:tr) do
            columns.collect do |c|
              content_options = {}

              if !c.options[:link].nil? && c.options[:link] ==true
                template.output_buffer << content_tag(:th, self.sort_link_helper(c.th_value, self.params, c.options[:column]))
              else
                template.output_buffer << content_tag(:th, c.th_value, content_options)
              end
            end
            if action_column.size >0
              template.output_buffer << content_tag(:th, action_column[0].th_value, {:colspan => action_column[0].actions.size})
            end
          end
        end
        list.collect do |item|
          #preparing body rows
          template.output_buffer << template.content_tag(:tr) do
            columns.collect do |c|
              template.output_buffer << template.content_tag(:td, c.td_value(item))
            end
            if action_column.size >0
              action_column[0].actions.each do |key, action|
                if action=='edit'
                  edit_link = {:controller => controller.controller_name, :action => 'edit', :id => item.id}
                  template.output_buffer << template.content_tag(:td, link_to('Edit', edit_link))
                elsif action=='view'
                  template.output_buffer << template.content_tag(:td, link_to('Show', item))
                elsif action=='delete'
                  template.output_buffer << template.content_tag(:td, link_to('Destroy', item, method: :delete, data: {confirm: 'Are you sure?'}))
                end
              end
            end

          end
        end
      end
    end

    #sorting linnk
    def sort_link_helper(text, params, column)

      key = column

      key += "_reverse" if params[:sort] == column
      options = {
          :url => {:action => 'index', :params => params.merge({:sort => key, :page => nil})},
          :update => 'table',
          :before => "Element.show('spinner')",
          :success => "Element.hide('spinner')"
      }
      html_options = {
          :title => "Sort by this field"
      }
      link_to(text, {:controller => controller.controller_name, :action => controller.action_name, :sort => key, :page => params[:page].nil? ? 1 : params[:page]}, html_options)
    end

  end

end