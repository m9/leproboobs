require "open-uri"
require 'timeout'
require 'json'

class RedirectAction < Cramp::Action
  def respond_with
    url = "http://www.suinoblog.com/wp-content/wet-big-boobs-arika1.jpg"
    begin
      get  = Timeout::timeout(5){
        r = open("http://api.oboobs.ru/noise/1/").read
        jData = ActiveSupport::JSON.decode(r)
        path = jData[0]['preview']
        url  = "http://media.oboobs.ru/#{path}"
      }
    rescue Timeout::Error => e
      puts "Request timeout, placeholder rendered."
    end
    [301, {'Location' => url}]
  end

  def start
    finish
  end
end
