'use strict'

window.uploader ||= {}
class Audits.Candidate

  elements =
    documentUploadBtn: '.js-document-upload'
    multipleUpload: '#multipleupload'
    removeDoc: '.remove-doc'

  routes =
    uploadUrl: '/dashboard/documents/ajax_upload_documents'
    candidateUrl: '/dashboard/inspections/candidate'
    deleteDoc: '/dashboard/documents/ajax_delete_document'

  constructor: ->
    @init()

  init: ->
    @bindMultipleUpload()
    @bindUploadButton()
    @bindRemoveDoc()

  bindMultipleUpload: ->
    window.uploader = $(elements.multipleUpload).uploadFile({
      url: routes.uploadUrl,
      multiple:true,
      dragDrop:true,
      fileName:"file_field",
      afterUploadAll: () ->
        window.location.href = routes.candidateUrl
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
      $.get routes.deleteDoc,
        {
          id: $(this).attr('data-id')
        }, (data, status) ->
          $(that).parents().first().remove()



