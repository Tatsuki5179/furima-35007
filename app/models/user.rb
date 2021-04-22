class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastnamekana, presence: true
  validates :firstnamekana, presence: true

  
end