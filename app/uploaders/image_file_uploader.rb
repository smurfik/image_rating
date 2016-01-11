class ImageFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fill => [500, 500]
  end

  version :square do
    process :resize_to_fill => [336, 336]
  end
end
