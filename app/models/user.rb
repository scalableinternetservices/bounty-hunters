class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # when destroyed, destroy all posts
  has_many :posts, class_name: 'Task', dependent: :destroy
  # when destroyed, nullify all claimsrai
  has_many :claims, class_name: 'Task', dependent: :nullify
end
