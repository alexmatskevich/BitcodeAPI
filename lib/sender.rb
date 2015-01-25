module Sender

  def post_data(data, url)
    uri = URI(url)
    response = Net::HTTP.post_form(uri, data)
    response.body
  end

end