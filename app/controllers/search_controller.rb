class SearchController < ApplicationController

  def search
    @model_name = params[:model_name]
    search_text = params[:search_text]
    search_method = params[:search_method]
    if "book" == @model_name
      if search_method == "forward_match"
              @books = Book.where("title LIKE?","#{search_text}%")
      elsif search_method == "backward_match"
              @books = Book.where("title LIKE?","%#{search_text}")
      elsif search_method == "perfect_match"
              @books = Book.where(title: search_text)
      elsif search_method == "partial_match"
              @books = Book.where("title LIKE?","%#{search_text}%")
      else
              @books = Book.all
      end

    elsif "user" == @model_name
     if search_method == "forward_match"
              @users = User.where("name LIKE?","#{search_text}%")
      elsif search_method == "backward_match"
              @users = User.where("name LIKE?","%#{search_text}")
      elsif search_method == "perfect_match"
              @users = User.where(name: search_text)
      elsif search_method == "partial_match"
              @users = User.where("name LIKE?","%#{search_text}%")
      else
              @users = User.all
      end

    end

  end
end
