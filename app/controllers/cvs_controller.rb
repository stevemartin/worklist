class CvsController < ApplicationController
  def show
    @cv = User::Profile.find_by_url( params[:url] )
    respond_with(@cv) do
      if request.xhr?
        format.json { render @cv.to_json }
      else
        format.html { render }
      end
    end
  end
end
