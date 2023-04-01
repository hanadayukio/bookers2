class Book < ApplicationRecord
  # ActiveStorage を使って画像を持たせる
  has_one_attached :profile_image
  # Userとのアソシエーション
  belongs_to :user
end
