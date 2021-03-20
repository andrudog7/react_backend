class RestaurantsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    # def index 
    #     @restaurants = Restaurant.all 
    #     render json: @restaurants
    # end

    def create
        # @restaurants = Restaurant.all.where(city: restaurant_params[:location])
        # if @restaurants === []
            Restaurant.get_restaurants_from_yelp(restaurant_params[:location])
            @restaurants = Restaurant.all.where(city: restaurant_params[:location])
            # render json: @restaurants
            
        # else
            if current_user
                @my_restaurants = current_user.my_restaurants
                @serialized = []
                @restaurants.map{|res| @serialized << RestaurantSerializer.new(res)}
                render json: {restaurants: @serialized, my_restaurants: @my_restaurants}, status: :ok
            else
                render json: @restaurants
            end
        #end
        
    end

end

private 

def restaurant_params
    params.require(:restaurant).permit(:location)
end
