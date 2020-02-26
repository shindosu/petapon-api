class StickerInstance < ApplicationRecord
  belongs_to :sticker
  belongs_to :project
end
