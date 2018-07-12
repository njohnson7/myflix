# app/uploaders/large_cover_uploader.rb

class LargeCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fit: [665, 375]
end
