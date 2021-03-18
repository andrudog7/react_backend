class RestaurantsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @restaurants = Restaurant.all.where(city: restaurant_params[:location])
        if @restaurants.empty? === false
            if current_user
                @restaurants.concat(current_user.my_restaurants)
                render json: @restaurants
            else
                render json: @restaurants
            end
        else
            @restaurants = Restaurant.get_restaurants_from_yelp(restaurant_params[:location])
            render json: @restaurants
        end
        
    end

end

private 

def restaurant_params
    params.require(:restaurant).permit(:location)
end
