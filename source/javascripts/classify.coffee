container = 'body'

workingIndicatorClass = 'classifying'
hitsIndicatorClass = 'classified'
updateWorkingIndicatorClass = (active) ->
  $(container).toggleClass(workingIndicatorClass, active > 0)

$ ->
  abort = false
  active = 0
  sentstrokes = 0
  latex_classifier = new Detexify(baseuri: "/api/")

  classify = (strokes) ->
    console.log("Classifying!")
    abort = false
    active = active + 1
    updateWorkingIndicatorClass(active)
    sentstrokes = sentstrokes + 1
    sentstrokeswhencalled = sentstrokes
    latex_classifier.classify strokes, (json) ->
      return
    return

  # Canvas
  c = $.canvassify("#tafel",
    callback: classify
  )
  $("#clear").click (e) ->
    e.stopPropagation()
    e.preventDefault()
    abort = true
    active = 0
    updateWorkingIndicatorClass(active)
    sentstrokes = 0
    c.clear()
    $(container).removeClass(hitsIndicatorClass)
    $("#symbols").empty()

  $("#canvaserror").hide()
