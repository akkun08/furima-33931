class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        #  validates presence:true :email, format: { with: /\A\S+@\S+\.\S+\z/}
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,100}\z/.freeze
        validates_format_of  :password, presence: true, with: PASSWORD_REGEX, message: 'Password is invalid' 
        
    width_options presence :true do
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
          validates :japanese_last_name
          validates :japanese_first_name
        end
        
        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
                    validates :kana_last_name
          validates :kana_first_name
        end

                      validates :year_month_day 
          validates :name,length: { maximum: 6 }
      end
    end

  has_many :items
  has_many :comments
  has_many :purchases
end
