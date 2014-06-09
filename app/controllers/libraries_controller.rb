class LibrariesController < ApplicationController
 before_action :set_library, only: [:show, :update, :destroy]
  respond_to :json

def index
  respond_with Library.all
end

def create
  respond_with Library.create(library_params)
end

def show
respond_with @library
end

def update
  respond_with @library.update(library_params)
end

def destroy
  respond_with @library.destroy
end

private
  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:title, :owner)
  end

end