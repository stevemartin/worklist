class CvsController < ApplicationController
  def show
    @cv = User::Profile.find_by_url( params[:url] )
  end
end
