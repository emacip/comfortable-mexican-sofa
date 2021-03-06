class ComfortableMexicanSofa::Tag::Asset
  include ComfortableMexicanSofa::Tag

  def self.regex_tag_signature(label = nil)
    label ||= /[\w\-]+/
    /\{\{\s*cms:asset:(#{label}):?(.*?)\s*\}\}/
  end

  def content
    return unless (layout = Cms::Layout.find_by_slug(label))
    type    = params[0]
    format  = params[1]
    
    case type
    when 'css'
      out = "#{ComfortableMexicanSofa.config.content_route_prefix}/cms-css/#{label}.css"
      out = "<link href='#{out}' media='screen' rel='stylesheet' type='text/css' />" if format == 'html_tag'
      out
    when 'js'
      out = "#{ComfortableMexicanSofa.config.content_route_prefix}/cms-js/#{label}.js"
      out = "<script src='#{out}' type='text/javascript'></script>" if format == 'html_tag'
      out
    end
  end
end
