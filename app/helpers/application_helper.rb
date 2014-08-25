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
end
