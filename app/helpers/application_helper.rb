module ApplicationHelper
  def status_tag(boolean, value = '', options={})
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true', :alt => value, :title => value)
    else
      content_tag(:span, options[:false_text], :class => 'status false', :alt => value, :title => value)
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def menu_active controller_name
    if controller.controller_name ==controller_name
      "active"
    end

  end

  def print_my_name(name)
    yield("Block String", "Second Param") if block_given?
    name.html_safe
  end



end
