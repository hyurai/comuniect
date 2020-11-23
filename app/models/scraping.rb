class Scraping < ApplicationRecord
    def self.get_infomation
        require 'mechanize'
        agent = Mechanize.new
        links = []
        current_page = agent.get("https://talent-dictionary.com/s/jobs/3/20?page=3")
        elements = current_page.at('.home_talent_list_wrapper')
        boxs = elements.search('.item')
        roks = boxs.search('.right')
        qqqs = roks.search('a')
        eees = qqqs.search('.title')
        eees.each do |eee|
            links <<  eee.inner_text
        end
        links.each do |link|
            get_personal_infomation('https://talent-dictionary.com/' + link)
        end
    end
    def self.get_personal_infomation(link)
        agent = Mechanize.new
        personal_page = agent.get(link)
        aaas = personal_page.at('.talent_name_wrapper')
        ages = aaas.at('.age').inner_text.delete('歳').to_i if aaas.at('.age')
        names = aaas.at('h1').inner_text  if aaas.at('h1')
        image_urls = personal_page.at('.main_image img').get_attribute('src') if personal_page.at('.main_image img')
        infomation = Infomation.where(name: names).first_or_initialize
        infomation.age = ages
        infomation.image_url = image_urls
        infomation.save
    end
end