require ''
require ''

@base_url = "http://ja.wikipedia.org"

category_url = "/wiki/Category:xxxxx
xxxxxxxxxxxxxxx
xxxxxxxxxxxxxxx"

def category_search()
  return if depth >= 4
  doc = Nokogiri::HTML(open(@base_url+url))
  doc.xpath("//div[@class='CategoryTreeItem']/a").each do |element|
    puts element.text
    puts element[:href]

    category_search(element[:href], dpeth+1)
  end
end

category_search(category_url, 1)
