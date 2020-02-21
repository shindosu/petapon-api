json.array! @stickers do |sticker|
  json.extract! sticker, :name, :image, :height, :width, :selected, :favorite
end