class FavoritesController < ApplicationController
  def index
    user = User.includes(:favorite_contacts).find(params[:user_id])
    render json: user.favorite_contacts
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: favorite
    else
      render(
        json: favorite.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    if favorite.destroy
      render json: favorite
    else
      render text: "You must still like me!"
    end
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  private
  def favorite_params
    params[:favorite].permit(:user_id, :contact_id)
  end
end
