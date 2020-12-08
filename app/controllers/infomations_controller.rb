class InfomationsController < ApplicationController
    def index
        @infomations = Infomation.all
        @infomations_rankings = Infomation.find(Favorite.group(:infomation_id).order('count(infomation_id) Asc').limit(3).pluck(:infomation_id))
    end
    def show
        @infomation = Infomation.find(params[:id])
        @comments = @infomation.comments
        @favorite = @infomation.favorites
    end
    def create
        talent_name = params[:talent_name]
        agent = Mechanize.new
        personal_page = agent.get('https://talent-dictionary.com/' + talent_name) 
        aaas = personal_page.at('.talent_name_wrapper') 
        @ages = aaas.at('.age').inner_text.delete('歳').to_i if aaas.at('.age')
        @names = aaas.at('h1').inner_text  if aaas.at('h1')
        @image_urls = personal_page.at('.main_image img').get_attribute('src') if personal_page.at('.main_image img')
        @infomation = Infomation.where(name: @names).first_or_initialize
        @infomation.age = @ages
        @infomation.image_url = @image_urls
        @infomation.save
    end
    private
end
