class Client < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    translates :name, :address, :description
end
