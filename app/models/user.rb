class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         


with_options presence: true do
  validates :nickname,               presence: true
  validates :encrypted_password,     presence: true, length: { minimum: 6 }
  validates :birthday
  validates :lastname,              format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :firstname,             format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :lastnamekana,          format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :firstnamekana,         format: {with: /\A[ァ-ヶー－]+\z/ }




  
end
