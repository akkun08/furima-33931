class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
        validates_format_of  :password, presence: true, with: PASSWORD_REGEX, message: 'Password is invalid' 
        
      with_options presence: true do
        with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
          validates :japanese_last_name
          validates :japanese_first_name
        end
        
          with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
          validates :kana_last_name
          validates :kana_first_name
        end

          validates :year_month_day 
          validates :name
      end

  has_many :items
  has_many :comments
  has_many :purchases
end
