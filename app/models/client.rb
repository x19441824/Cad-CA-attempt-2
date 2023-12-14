class Client < ApplicationRecord
    translates :name, :address, :description
end
