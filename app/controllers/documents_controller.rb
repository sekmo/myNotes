class DocumentsController < ApplicationController
  def index
    @documents = Document.order("created_at DESC")
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_document
  end
  def document_params
    params.require(:document).permit(:title, :content)
  end
end
