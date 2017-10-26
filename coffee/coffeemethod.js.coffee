class ABC
  # public method
  method1: ->
    console.log "method1"
    method3()

  method2: =>
    console.log "method2"
    this.method1()

  # private method - local variable
  method3 = ->
    console.log "method3"

a = new ABC
a.method1()
a.method2()
a.method3()



#method1
#method3
#method2
#method1
#method3
#TypeError: a.method3 is not a function
#  at eval:35:3
#  at eval
#  at n.<anonymous>