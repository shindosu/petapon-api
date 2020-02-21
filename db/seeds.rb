puts "Deleting all stickers..."
Sticker.delete_all
puts "Creating new stickers..."

def scrape
  url = "http://shop-bside-label.com/?mode=cate&cbid=2106298&csid=0&sort=n"
  # sticker_url = "http://shop-bside-label.com/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.contents .main div .item_box .item_photo a').each_with_index do |element,index|
    id = html_doc.search('.contents .main div .item_box .item_photo a')[index].attributes["href"].value
    sticker_url = "http://shop-bside-label.com/#{id}"
    html_file_description = open(sticker_url).read
    html_doc_description = Nokogiri::HTML(html_file_description)
    sticker_description = html_doc_description.search('.contents .main form')
    sticker_image = "http:#{sticker_description.search(".product_detail_area .product_images .zoom-section .zoom-small-image #wrap").children[1].attributes["href"].value}" #
    sticker_height = sticker_description.search(" .product_detail_area .product_images .zoom-section .zoom-small-image #wrap .product_description").children[2].text.split("×").first.gsub(/[^\d]/,"").to_i#
    sticker_width = sticker_description.search(" .product_detail_area .product_images .zoom-section .zoom-small-image #wrap .product_description").children[2].text.split("×").last.gsub(/[^\d]/,"").to_i#
    sticker_name = sticker_description.search(".product_name").text
    Sticker.create(
      name: sticker_name,
      image: sticker_image,
      height: sticker_height,
      width: sticker_width
    )
    break if index == 11
  end
end

scrape
puts "Done! Created #{Sticker.count} stickers"