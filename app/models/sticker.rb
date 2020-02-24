class Sticker < ApplicationRecord
  has_many :projects, through: :sticker_instances
end
