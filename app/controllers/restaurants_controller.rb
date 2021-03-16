class RestaurantsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        if Restaurant.all.where(city: restaurant_params[:location]).empty? === false
            @restaurants = Restaurant.all.where(city: restaurant_params[:location])
            render json: @restaurants
        else
            @restaurants =Restaurant.get_restaurants_from_yelp(restaurant_params[:location])
            render json: @restaurants
        end
        
    end

end

private 

def restaurant_params
    params.require(:restaurant).permit(:location)
end
