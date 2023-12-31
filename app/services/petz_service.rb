require 'nokogiri'
require 'open-uri'
require 'openssl'
require "net/https"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class PetzService
  def initialize(keyword)
    @keyword = I18n.transliterate(keyword)
  end

  def call
    # 1. We get the HTML page content thanks to open-uri
    # begin
    #   html_content = URI.parse("https://www.petz.com.br/busca?q=#{@keyword}")
    #   # 2. We build a Nokogiri document from this file
    #   doc = Nokogiri::HTML.parse(html_content)
    # rescue OpenURI::HTTPError => e
    #   puts "PetzService: #{e.message}"
    #   return []
    # end
    html_content = URI.open("https://www.royalpets.com.br/busca?ft=#{@keyword}", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
    doc = Nokogiri::HTML.parse(html_content)
    # uri = URI("https://www.petz.com.br/busca?q=#{@keyword}")
    # req = Net::HTTP::Get.new(uri.path)
    # res = Net::HTTP.start(
    #   uri.host, uri.port,
    #   :use_ssl => uri.scheme == 'https',
    #   :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |https|
    #   https.request(req)
    # end
    # doc = Nokogiri::HTML(URI.parse(("https://www.petz.com.br/busca?q=#{@keyword}")).open)
    # url = "https://www.petz.com.br"

    array = []
    # 3. We search for the correct elements containing the items' title in our HTML doc
    # doc.search('.card-product a').each_with_index do |e, _index|
    #   link_t = url + e["href"]
    #   product = {}
    #   product.store(:name, e["data-nomeproduto"])
    #   product.store(:price, e["data-precoproduto"].to_f)
    #   product.store(:link, link_t)
    #   array.push(product)
    # end
    doc.search('.shelf-item').each_with_index do |e, _index|
      # link_t = url + e["href"]
      product = {}
      product.store(:name, e.attribute_nodes[1].value)
      product.store(:price, e.children[13].children.text.gsub(' R$', "").to_f)
      product.store(:link, e.children[21].children[1].attribute_nodes[1].value)
      array.push(product)
    end

    # link.map! { |e| url + e }

    # array.each do |item|
    #   arrayhash.push(JSON.parse item.gsub('=>',':'))
    # end
    return array
  end
end
