module ApplicationHelper
  def backbone_active_if(title, options)
    content_tag :li, :class => options[:class] do
      link_to title, options[:resource]
    end
  end
  def active_li_if(title, resource)
    options= {}
    options[:class] = current_page?(:controller => resource) ? 'active' : ''
    options[:resource] = resource
    backbone_active_if title, options
  end
end

