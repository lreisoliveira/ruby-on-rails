class Apdata
  def self.get(filtro)
    url = CONFIG['apdata']['base_uri'] + '?' + filtro.to_s
    headers = {'Content-Type' => 'application/json'}
    response = HTTParty.get(url, :headers => headers)
    response.code == 200 ? response : nil
  end
end