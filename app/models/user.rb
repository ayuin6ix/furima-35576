class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do

  validates :nickname, :family_name, :first_name, :birth_day
  validates :password,  length: { minimum: 6 }, 
            confirmation: true,
            
            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :email,  
            
            uniqueness: { case_sensitive: false }, 
     
            
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :family_name_kana, :first_name_kana, 
            
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }

  end
end
