require "rubygems"
require 'capybara'
require "capybara/dsl"

Capybara.default_driver = :selenium
Capybara.run_server = false

class Scraper
    include Capybara::DSL


    def scrape
        Capybara.app_host = 'http://www2.ferienwohnungen-davos.ch/'
        visit('/')
        p page.has_content?('Top Ferienwohnungen in Davos und Leukerbad online buchen !')
        all(:xpath, "//*[@class='hasDatepicker']").each_with_index { |inp,i|  p inp; inp.set "Here"}
        # within("#search_form") do
        p has_content?('Wohnung suchen:')
        #fill_in '.p_select_date', :with => '1.9.2013'
        #     fill_in '#date2', :with => '8.9.2013'
        #find_button(:xpath, "@name='go'").click

        # end
        #p page.has_content?('Folgende Wohnungen entsprechen Ihren Kriterien:')
    end
    
end

s = Scraper.new

s.scrape