class Template < ApplicationRecord
    has_one_attached :template_file
    has_many_attached :thumbnails
end
