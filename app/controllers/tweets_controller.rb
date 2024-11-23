class TweetsController < ApplicationController
  # before_action :validate_id, only: :show
  before_action :authenticate_user!, only: [:new, :create]

    def index
        @tweets = Tweet.includes(:user).all
    end

    def index
      @tweets = Tweet.order(created_at: :desc)
    end

    def waseda
      @tweets = Tweet.order(created_at: :desc)
    end

    def keio
      @tweets = Tweet.order(created_at: :desc)
    end


    def new
        @tweet = Tweet.new
      end
    
      def create
        tweet = Tweet.new(tweet_params)

        tweet.user_id = current_user.id 

        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "Tweet not found"
        redirect_to tweets_path

      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end
    
      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      def toudai
        @tweets = Tweet.where(access: '東京大学')
      end

      def toukoudai
        @tweets = Tweet.where(access: '東京工業大学大学')
      end

      def hitotubashi
        @tweets = Tweet.where(access: '一橋大学')
      end

      def yokokoku
        @tweets = Tweet.where(access: '横浜国立大学')
      end

      def waseda
        @tweets = Tweet.where(access: '早稲田大学')
      end

      def keio
        @tweets = Tweet.where(access: '慶応義塾大学')
      end

      def sophia
        @tweets = Tweet.where(access: '上智大学')
      end

      def rikadai
        @tweets = Tweet.where(access: '東京理科大学')
      end

      def meiji
        @tweets = Tweet.where(access: '明治大学')
      end

      def aogaku
        @tweets = Tweet.where(access: '青山学院大学')
      end

      def rikkyo
        @tweets = Tweet.where(access: '立教大学')
      end

      def chuo
        @tweets = Tweet.where(access: '中央大学')
      end

      def housei
        @tweets = Tweet.where(access: '法政大学')
      end

      def gakushuin
        @tweets = Tweet.where(access: '学習院大学')
      end

      def nihon
        @tweets = Tweet.where(access: '日本大学')
      end

      def toyo
        @tweets = Tweet.where(access: '東洋大学')
      end
      
      def komazawa
        @tweets = Tweet.where(access: '駒澤大学')
      end

      def senshu
        @tweets = Tweet.where(access: '専修大学')
      end

      def seijo
        @tweets = Tweet.where(access: '成城大学')
      end

      def seikei
        @tweets = Tweet.where(access: '成蹊大学')
      end

      def meigaku
        @tweets = Tweet.where(access: '明治学院大学')
      end

      def meigaku
        @tweets = Tweet.where(access: '獨協大学')
      end

      def kokugakuin
        @tweets = Tweet.where(access: '國学院大学')
      end

      def musashi
        @tweets = Tweet.where(access: '武蔵大学')
      end

      def tokai
        @tweets = Tweet.where(access: '東海大学')
      end

      def daitobunka
        @tweets = Tweet.where(access: '大東文化大学')
      end

      def asia
        @tweets = Tweet.where(access: '亜細亜大学')
      end

      def teikyo
        @tweets = Tweet.where(access: '帝京大学')
      end

      def kokushikan
        @tweets = Tweet.where(access: '国士館大学')
      end





      private
      def tweet_params
        params.require(:tweet).permit(:shop, :genre, :access,:about,:menu,:image, :star)
      end
    end
