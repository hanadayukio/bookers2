class Book < ApplicationRecord
  # ActiveStorage を使って画像を持たせる
  has_one_attached :profile_image
  # Userとのアソシエーション
  belongs_to :user
  
  validates :title,presence: true
  validates :body,presence: true,length: {maximum: 200}
  
end
