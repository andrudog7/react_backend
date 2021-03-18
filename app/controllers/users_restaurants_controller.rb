class UsersRestaurantsController < ApplicationController

    def create 
        if users_restaurants_params.include?("bottomless") || users_restaurants_params.include?("reservations")
            relationship = UsersRestaurant.find_or_create_by(user_id: users_restaurants_params[:user_id], restaurant_id: users_restaurants_params[:restaurant_id])
            relationship.update(users_restaurants_params)
            # @restaurant = Restaurant.find(relationship.restaurant_id)
            render json: relationship
        else
        relationship = UsersRestaurant.find_or_create_by(users_restaurants_params)
        relationship.my_profile = true 
        relationship.save
        @restaurant = Restaurant.find(relationship.restaurant_id)
        render json: @restaurant
        end
        
    end

    def update 
        if params[:users_restaurants][:my_profile]
            @relationship = UsersRestaurant.find(params[:id])
            @relationship.update(:my_profile => users_restaurants_params[:my_profile])
            render json: @relationship
        elsif params[:users_restaurants][:bottomless]
            @relationship = UsersRestaurant.find(params[:id])
            byebug
        end
    end

    private

    def users_restaurants_params
        params.require(:users_restaurants).permit(:restaurant_id, :user_id, :my_profile, :bottomless, :reservations)
    end
end
