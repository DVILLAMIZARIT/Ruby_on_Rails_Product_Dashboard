class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.create(first_name:params['user']['first_name'], last_name:params['user']['last_name'], email_address:params['user']['email_address'], password:params['user']['password'])
    redirect_to '/users/index'
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

  def edit
    @user = User.find(params[:id])
    @schema = User.new
    render 'edit'
  end

  def update
    User.find(params[:id]).update(first_name:params['user']['first_name'], last_name:params['user']['last_name'], email_address:params['user']['email_address'], password:params['user']['password'])
    redirect_to '/users'
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/users'
  end
end
