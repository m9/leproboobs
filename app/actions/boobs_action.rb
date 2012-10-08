require "open-uri"
require 'timeout'
require 'json'

class BoobsAction < Cramp::Action
  def respond_with
    [200, {'Content-Type' => 'image/jpg'}]
  end

  def start
    begin
      get  = Timeout::timeout(5){
        r = open("http://api.oboobs.ru/noise/1/").read
        jData = ActiveSupport::JSON.decode(r)
        url = jData[0]['preview']
        render open("http://media.oboobs.ru/#{url}").read
      }
    rescue Timeout::Error => e
      puts "Request timeout, placeholder rendered."
      render open("http://www.suinoblog.com/wp-content/wet-big-boobs-arika1.jpg").read
    end
    finish
  end
end
