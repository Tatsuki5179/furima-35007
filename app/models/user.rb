class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items

         with_options presence: true do
          validates :nickname
          validates :password,             format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze}
          validates :birth_date
         end

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
          validates :last_name
          validates :first_name
        end
      
        
        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }do
          validates :last_name_kana
          validates :first_name_kana
        end
end
