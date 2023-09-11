class PetzService
  require 'nokogiri'
  require 'open-uri'

  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # 1. We get the HTML page content thanks to open-uri
    html_content = URI.open("https://www.petz.com.br/busca?q=#{@keyword}").read

    # 2. We build a Nokogiri document from this file
    doc = Nokogiri::HTML.parse(html_content)

    url = "https://www.petz.com.br"

    array = []
    # 3. We search for the correct elements containing the items' title in our HTML doc
    doc.search('.card-product a').each_with_index do |e, _index|

      link_t = url + e["href"]
      product = {}
      product.store(:name, e["data-nomeproduto"])
      product.store(:price, e["data-precoproduto"].to_f)
      product.store(:link, link_t)
      array.push(product)
    end

    # link.map! { |e| url + e }

    # array.each do |item|
    #   arrayhash.push(JSON.parse item.gsub('=>',':'))
    # end
    return array
  end
end
