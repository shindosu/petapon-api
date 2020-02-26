class Project < ApplicationRecord
  belongs_to :user
  has_many :stickers, through: :sticker_instances
  has_many :devices, through: :sticker_instances
end
