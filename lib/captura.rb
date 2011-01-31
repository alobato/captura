# encoding: UTF-8
require 'nokogiri'
require 'net/http'

module Captura

  def source(url, cookie = nil)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, 80)
    http.open_timeout = http.read_timeout = 10 # seconds
    headers = { 'Cookie' => cookie } if cookie
    path = uri.path + (uri.query ? "?#{uri.query}" : "")
    if headers
      resp, data = http.get(path, headers)
    else
      resp, data = http.get(path)
    end
    resp.body
  end

  def xpath_content(body, xpath)
    html_doc = Nokogiri::HTML(body)
    return '' if html_doc.xpath(xpath).size == 0
    html_doc.xpath(xpath).first.content
  end

  def css_content(body, css, index = 0)
    html_doc = Nokogiri::HTML(body)
    return '' if html_doc.css(css).size == 0
    html_doc.css(css)[index].content
  end

  def xpath_attribute(body, xpath, attribute)
    html_doc = Nokogiri::HTML(body)
    return '' if html_doc.xpath(xpath).size == 0
    html_doc.xpath(xpath).first.attribute(attribute).to_s
  end

  def css_attribute(body, css, attribute)
    html_doc = Nokogiri::HTML(body)
    return '' if html_doc.css(css).size == 0
    html_doc.css(css).first.attribute(attribute).to_s
  end

  def collection_css_attribute(body, css, attribute)
    html_doc = Nokogiri::HTML(body)
    links = []
    html_doc.css(css).each do |link|
      links << link.attribute(attribute).to_s
    end
    links
  end

end
