require 'rubygems'
require 'mechanize'
require 'open-uri'

agent = Mechanize.new

class Apt

    def set_room_data(data_array)
        @rooms = data_array[1]
        @beds = data_array[3]
        @bathrooms = data_array[5]
        @bedrooms = data_array[7]

    end
end
def set_room_data(data_array)
    rooms = data_array[1]
    beds = data_array[3]
    bathrooms = data_array[5]
    bedrooms = data_array[7]
    p "Rooms: #{rooms}, Beds: #{beds}, Bathrooms: #{bathrooms}, Bedrooms: #{bedrooms}"
end

# agent.get("http://www2.ferienwohnungen-davos.ch/index.cfm")

# p agent.page.forms[0].fields
# p agent.page.forms[1].fields
# p agent.page.forms[2].fields

# search_form = agent.page.forms[0]

# search_form["tag"] = "21.09.2013"
# search_form["tag2"] = "28.09.2013"
# search_form.submit
html_dir = File.dirname(__FILE__)
p html_dir
agent.get("file:///#{html_dir}//ruby//rent//rent2.html")
#p page.content
agent.page.links_with(:class => "a_object_name_list").each do |link|
   info = link.text.split("\u00A0,\u00A0") 
   # p info[0], info[1]
end

listings = agent.page.search('table.t_dsp_object_list')
listings.each do |item|
    stars = item.search("..//img[contains(@src, 'star')]").count
    s = item.search("..//a[@class='a_object_name_list']")[0].text.split("\u00A0,\u00A0") 
    name, place = s[0], s[1]

    price = item.search("td b")[0].text
    currency, price = price.split("\u00A0") 
    price.gsub("'", "") if price

    room_node = item.search("td.t_dsp_object_list_room")[0]
    data_array = room_node.text.split("\u00A0")
    data_array.delete("")
    set_room_data( data_array)

    p "#{name}, #{place}, #{stars}, #{currency} #{price}"
end