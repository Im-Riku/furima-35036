class UsersController < ApplicationController
  def create
    @user = User.new
    if @user.save
    else
      render "registration/new"
    end
  end
end
