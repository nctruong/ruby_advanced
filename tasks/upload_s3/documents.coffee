'use strict'

window.Audits ||= {}
window.Audits.Components ||= {}

class Audits.Components.Documents
  elements =
    documentUploadBtn: '.js-document-upload'
    multipleUpload: '#multipleupload'
    removeDoc: '.remove-doc'

  constructor: ->
    console.log "new Document init"
    @init()

  init: ->
    @bindMultipleUpload()
    @bindUploadButton()
    @bindRemoveDoc()

  bindMultipleUpload: (redirect_url = '') ->
    window.uploader = $(elements.multipleUpload).uploadFile({
      url: Routes.ajax_upload_documents_dashboard_documents_path(),
      multiple:true,
      dragDrop:true,
      fileName:"file_field",
      acceptFiles:".xlsx, .xls, .csv, .pdf",
      afterUploadAll: () ->
        window.location.href = redirect_url
    });

  bindUploadButton: ->
    $(elements.documentUploadBtn).click ->
      window.uploader.reset()
      window.uploader.update({
        formData:{
          evaluation_id: $(this).attr('data-evaluation-id')
        }
      })

  bindRemoveDoc: ->
    $(elements.removeDoc).click ->
      that = this
      $.get Routes.ajax_delete_document_dashboard_documents_path(),
        {
          id: $(this).attr('data-id')
        }, (data, status) ->
          $(that).parents().first().remove()