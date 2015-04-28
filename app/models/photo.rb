class Photo < ActiveRecord::Base

belongs_to :category
belongs_to :post

#Attributes or fields
attr_accessible :image, :pic_name, :description

#carrier wave
mount_uploader :image, PhotoUploader

end