class NotesController < ApplicationController
  before_action :check_logged_in
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:notice] = "The note has been created successfully."
      redirect_to notes_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      flash[:notice] = "The note has been updated."
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = "The note has been deleted."
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      redirect_to_root_with_request_error
    end
    rescue ActiveRecord::RecordNotFound
      redirect_with_general_error
  end

  def redirect_to_root_with_request_error
    flash[:notice] = "Error in your request"
    redirect_to root_url
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
