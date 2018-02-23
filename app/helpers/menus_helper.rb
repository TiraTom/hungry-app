require 'open-uri'
require 'nokogiri'
require 'csv'
require 'selenium-webdriver'
require 'net/http'
require 'uri'

module MenusHelper
    def getPage
        
        driver = Selenium::WebDriver.for :firefox
        
        # スクレイピング先のURL
        driver.navigate.to = "http://www.tamagoya.co.jp/menu_list.html"
        driver.manage.timeouts.implicit_wait = 30
        
        latestnews = driver.find_element(:css, "latestnews_txt").text
        
        
        
        driver.quit
#        uri = 'http://www.yahoo.co.jp/'
#        doc = Nokogiri::HTML(open(uri), nil, "utf-8")
#        doc = Nokogiri::HTML.parse(open(uri), nil, "utf-8")
        charset = nil
        html = open(url) do |f|
          charset = f.charset # 文字種別を取得
          f.read # htmlを読み込んで変数htmlに渡す
        end
        # htmlをパース(解析)してオブジェクトを作成
        doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
        byebug
        doc2 = doc.css("div#customscroll")
        doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
          # tilte
          p node.css('h3').inner_text
          # 記事のサムネイル画像
          p node.css('img').attribute('src').value
          # 記事のサムネイル画像
          p node.css('a').attribute('href').value
        end
    end
end
