class NotesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @note = Note.new
    @user = User.find(params[:user_id])
  end

  def create
    @note = Note.new(title: params[:title])
    @note.save!
  end
end
