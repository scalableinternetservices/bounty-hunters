class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #please work:http://stackoverflow.com/questions/9173412/rails-two-foreign-keys-on-one-model-both-refer-to-same-model       
  
  # when destroyed, destroy all posts
  has_many :posts, class_name: 'Task', dependent: :destroy, :foreign_key => :owner_id
  # when destroyed, nullify all claimsrai
  has_many :claims, class_name: 'Task', dependent: :nullify, :foreign_key => :claimer_id
end
