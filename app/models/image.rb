class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true

  # mount_uploaders :image, ImageUploader
  # belongs_to :item, optional: true, inverse_of: :images
end
