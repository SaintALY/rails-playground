class RailswikiController < ApplicationController
    def index
        @railswiki = Railswiki.all
    end

    def new
        @railswiki = Railswiki.new
    end

    def create
        @railswiki = Railswiki.new(railswiki_params)
        @railswiki.save
        redirect_to_railswiki_path(@railswiki)
    end

    def show
        @railswiki = Railswiki.find(params[:id])
    end

    private

    def railswiki_params
        params.require(:railswiki).permit(:title, :content, :wiki_url, :wiki_tag)
    end
end
