class DocumentsController < ApplicationController
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
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(document_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to 'documents_path'
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end
  def document_params
    params.require(:document).permit(:title, :content)
  end
end
