class RestaurantsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index 
        @restaurants = Restaurant.all 
        render json: @restaurants
    end

    def create
        @restaurants = Restaurant.all.where(city: restaurant_params[:location])
        if @restaurants === []
            Restaurant.get_restaurants_from_yelp(restaurant_params[:location])
            @restaurants = Restaurant.all.where(city: restaurant_params[:location])
            render json: @restaurants
        else
            if current_user
                @restaurants.concat(current_user.my_restaurants).uniq
                render json: @restaurants
            else
                render json: @restaurants
            end
        end
        
    end

end

private 

def restaurant_params
    params.require(:restaurant).permit(:location)
end
