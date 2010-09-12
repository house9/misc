require 'rubygems'
gem 'RubyInline', '= 3.6.3' 
require 'scrubyt'

#Scrubyt.logger = Scrubyt::Logger.new

google_data = Scrubyt::Extractor.define do
  fetch 'http://www.google.com/'
  fill_textfield 'q', 'ruby'
  submit
  link "//div[3]/div/ol/li" do
    head "/h3[@class='r']"
    des "/div[@class='s']" 
  end
  next_page "Next", :limit => 2
end

#puts google_data.to_xml

google_data.to_hash.each do |record|
  puts "********************"
  puts record[:head].to_s
  puts record[:des].to_s
end
