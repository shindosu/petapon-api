class Device < ApplicationRecord
  has_many :projects, through: :device_instances
end
