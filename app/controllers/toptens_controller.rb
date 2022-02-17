require "json"
require "open-uri"
require "nokogiri"
require 'uri'
require 'net/http'
require 'openssl'

class ToptensController < ApplicationController
  before_action :set_topten, only: [:show, :edit, :update, :destroy]

  # GET /toptens
  def index
    @toptens = Topten.all

    # url = "http://tmdb.lewagon.com/movie/top_rated"
    # movie_serialized = URI.open(url).read
    # @movies = JSON.parse(movie_serialized)

    # url = "https://www.claudia-maechtle.de/"
    # url = "https://www.google.de/maps/place/U+Heinrich-Heine-Stra%C3%9Fe/@52.5086709,13.4131792,15z/data=!4m5!3m4!1s0x47a84e25398bf107:0xa04b3e09a0d4d96a!8m2!3d52.510858!4d13.4163621"
    
    # html_file = URI.open(url).read
    # @html_doc = Nokogiri::HTML(html_file)
    username = "liobaer"
    user_id = "237266180"
    # url = URI("https://instagram47.p.rapidapi.com/get_user_id?username=#{username}")
    # url = URI("https://instagram47.p.rapidapi.com/user_followers?userid=#{user_id}")
    url = URI("https://instagram47.p.rapidapi.com/email_and_details?userid=#{user_id}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'instagram47.p.rapidapi.com'
    request["x-rapidapi-key"] = '0363c85d04msh3370cfb927787c3p1afecdjsn2b8cab3ddff8'

    @insta = http.request(request)
  end

  # GET /toptens/1
  def show
  end

  # GET /toptens/new
  def new
    @topten = Topten.new
  end

  # GET /toptens/1/edit
  def edit
  end

  # POST /toptens
  def create
    @topten = Topten.new(topten_params)

    if @topten.save
      redirect_to @topten, notice: 'Topten was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /toptens/1
  def update
    if @topten.update(topten_params)
      redirect_to @topten, notice: 'Topten was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /toptens/1
  def destroy
    @topten.destroy
    redirect_to toptens_url, notice: 'Topten was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topten
      @topten = Topten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topten_params
      params.require(:topten).permit(:name, :comment, :address, :stars)
    end
end
