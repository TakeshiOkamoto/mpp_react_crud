class ReactCrudDatum < ApplicationRecord
  validates :name, length: { maximum: 20 }, presence: true
  validates :comment, length: { maximum: 140 },  presence: true
end
