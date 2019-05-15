class Post < ApplicationRecord
  acts_as_votable
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_image
  validates_processing_of :image
  validate :image_size_validation
  belongs_to :user,optional:true
  has_many :comments, dependent: :destroy

  def crop_image
    puts "Yay"
    image.recreate_versions! if crop_x.present?
    puts "after"
  end
  private
  def image_size_validation
    errors[:image] << "should be less than 3MB" if image.size > 3.megabytes
  end
end
