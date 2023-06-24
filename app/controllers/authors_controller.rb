class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    author = Author.find(params[:id])
    render json: author
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  
  def author_params
    params.require(:author).permit(:email, :name)
  end
end
