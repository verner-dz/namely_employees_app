class Image < ActiveRecord::Base
  belongs_to :user
  def ocr_req(filename)
    response = Unirest::post "https://poiuytrez-ocrapiservice.p.mashape.com/1.0/rest/ocr",
  headers: {
    "X-Mashape-Authorization" => OCR_KEY
  },
  parameters: {
    "image" => File.new(filename, 'rb'),
    "language" => "en"
  }
  end

end
