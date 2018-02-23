require 'open-uri'
require 'nokogiri'
require 'csv'
require 'selenium-webdriver'

module MenusHelper
    def getPage
        
        driver = Selenium::WebDriver.for :firefox
        
        # スクレイピング先のURL
        driver.navigate.to = "http://www.tamagoya.co.jp/menu_list.html"
        latestnews = driver.find_element(:class, "latestnews_txt")
        
        
        
        driver.quit
   end
end
