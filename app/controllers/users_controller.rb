class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update]
  # before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.order(updated_at: :desc).page(params[:page]).limit(5)
  end

  def show
    @user = User.find(params[:id])
    @tickets = @user.tickets.page(params[:page]).order(created_at: :desc)
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
