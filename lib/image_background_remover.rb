module ImageBackgroundRemover
  def self.process(image_url, image_name)
    result = RemoveBg.from_url(image_url)
    File.open("#{Rails.public_path}/#{image_name}.png", "wb") { |f| f.write(result.data) } 
  end
end