class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index 
        @users = User.all 
        render json: @users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            if @user.image === ""
                @user.image = "https://icon-library.net//images/no-user-image-icon/no-user-image-icon-27.jpg"
                @user.save
            end
            @token = encode_token({user_id: @user.id}, Time.now.to_i + 864000)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else 
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :city, :image)
    end

end
