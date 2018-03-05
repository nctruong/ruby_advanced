class Dashboard::DocumentsController < ApplicationController
  before_action :set_document, only: [:ajax_delete_document]

  def ajax_upload_documents
    evaluation = EvaluationItem.find_by(id: params[:evaluation_id]&.to_i)
    unless evaluation.nil?
      Document.create(document_params)
      render json: {success:true}
    end
  end
  
  def ajax_delete_document
    @document.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_params
      params.permit(:status, :name, :path, :owner_id, :evaluation_id, :file_field)
    end
end
