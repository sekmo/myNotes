class DocumentsController < ApplicationController
  before_action :check_logged_in
  #before_action :check_document_owner, only: [:show, :edit, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  def index
    @documents = Document.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      flash[:notice] = "The note has been created successfully."
      redirect_to documents_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(document_params)
      flash[:notice] = "The note has been updated."
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    flash[:notice] = "The note has been deleted."
    redirect_to documents_path
  end

  private

  def set_document
    @document = Document.find(params[:id])
    if @document.user_id != current_user.id
      redirect_to_root_with_request_error
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to_root_with_request_error
  end

  def redirect_to_root_with_request_error
    flash[:notice] = "Error in your request"
    redirect_to root_url
  end

  def document_params
    params.require(:document).permit(:title, :content)
  end
end
