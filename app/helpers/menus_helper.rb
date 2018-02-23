require 'open-uri'
require 'nokogiri'
require 'csv'
require 'selenium-webdriver'

module MenusHelper
    def get_menu_info

        driver = Selenium::WebDriver.for :firefox

        driver.navigate.to "http://www.tamagoya.co.jp/menu_list.html"
        latestnews = driver.find_element(:id, "latestnews_txt")
        menu_date = latestnews.find_element(:class, "menutitle_date").text
        menu_details = latestnews.find_element(:class, "menu_list")
        menu_maindish = menu_details.find_element(:class, "menu_maindish").text
        menu_list_data = menu_details.find_elements(:class, "menu_arrow")
        menu_list = []
        menu_list_data.each do |list|
          menu_list.push(list.text)
        end

        driver.quit

        menu_info = {menudate: menu_date, maindish: menu_maindish, menulist: menu_list}

        return menu_info
   end
end
