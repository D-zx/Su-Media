class User < ApplicationRecord

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :role
  has_many :comments, dependent: :destroy
  has_many :assign_tasks

  before_validation :assign_role
  def assign_role
    self.role = Role.find_by_name("Volunter") if self.role.nil?
  end
  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  def volunter?
    self.role.name == "Volunter" if !self.role.blank?
  end
  def student?
    self.role.name == "Student" if !self.role.blank?
  end
end
