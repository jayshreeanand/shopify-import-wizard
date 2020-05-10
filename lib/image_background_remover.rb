module ImageBackgroundRemover
  def self.process(image_url)
    result = RemoveBg.from_url(image_url)
    File.open("output.png", "wb") { |f| f.write(result.data) } 
  end
end