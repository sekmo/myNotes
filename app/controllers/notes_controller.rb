class NotesController < ApplicationController
  before_action :check_logged_in
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.find_by_user(current_user).find_by_search_term(params[:search_term]).page(params[:page])
    @notes_by_month = @notes.page(params[:page]).grouped_by_month
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
      flash.now[:alert] = "Error in the creation of the note."
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
      redirect_to_root_with_request_error
  end

  def redirect_to_root_with_request_error
    flash[:notice] = "Error in your request"
    redirect_to root_url
  end

  def note_params
    params.require(:note).permit(:title, :content, :date)
  end
end
