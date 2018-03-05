bindDatePicker: ->
  currentTime = new Date($('.scheduled_date_formatted').val())
  minDate = new Date(currentTime.getFullYear(), currentTime.getMonth(), + 1)
  maxDate =  new Date(currentTime.getFullYear(), currentTime.getMonth() + 1, 0)
  console.log "mindate: " + minDate
  console.log "maxdate: " + maxDate
  $('.scheduled_date_formatted').datetimepicker
    minDate: minDate,
    maxDate: maxDate