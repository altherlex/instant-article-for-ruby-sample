module FeedHelper
  def corpo_with_ad(body)
    content = Nokogiri::HTML(body)
    content.xpath("//p[1]").first.add_next_sibling(render partial: 'feed/ad', formats: [:html])
    content.to_html.html_safe
  end
end
