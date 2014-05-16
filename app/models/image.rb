class Image < ActiveRecord::Base
  belongs_to :user
  def self.ocr_req(filename)
    response = Unirest::post "https://poiuytrez-ocrapiservice.p.mashape.com/1.0/rest/ocr",
    headers: {
      "X-Mashape-Authorization" => ENV["OCR_KEY"]
    },
    parameters: {
    "image" => File.new(filename, 'rb'),
     "language" => "en"
   }

   return response
  end

end
