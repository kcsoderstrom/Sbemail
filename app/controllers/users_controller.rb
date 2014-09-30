class UsersController < ApplicationController
  def index
    render json: User.all
    #render text: "Everybody! Everybody!"
    #render json: { 'a_key' => 'a value' }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end


  def show
    user = User.find(params[:id])
    render json: user
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: user
    else
      render text: "Could not destroy my friend!"
    end
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  private
  def user_params
    params[:user].permit(:username)
  end

end
