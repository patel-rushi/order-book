class HomeController < ApplicationController
    def index
        if params[:symbol] && params[:time]
            time = Time.parse(params[:time])
            @top_bids = Order.top_bids_for(params[:symbol], time)
            @top_asks = Order.top_asks_for(params[:symbol], time)
        end
    end
end