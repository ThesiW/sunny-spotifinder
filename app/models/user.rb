class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookmarks
  has_many :reviews
  has_many :favourites
  has_many :visits
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :picture


  def user_picture
    if self.picture.attached?
        self.picture.key
    else
      '04s5p8amefgigaoiipqup8r3f7vo'
    end
  end
end
