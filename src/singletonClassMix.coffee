# NOTE: here we are using 'singleton' terminology,
# but it is actually synonym to 'static'
# the two terms can be used interchangably

# singleton members
_privateSingletonProperty = 0
_privateSingletonMethod = (param) ->
  if typeof param is "function"
    param()
  else
    _privateSingletonProperty = param
  return

class Class

  # private members
  # note: '=' is used to define private members
  # naming convention for private members is _camelCase
  _privateMethod = (param) ->
    if typeof param is "function"
      param()
    else
      _privateProperty = param
    return
  _privateProperty = 0

  # static public property
  # @count = Class.count
  @count = 0

  # static public method
  # @staticMethod_countObjects = Class.staticMethod_countObjects
  # in this context, this = Class
  # therefore, @count = this.count = Class.count
  @staticMethod_countObjects = ->
    @count

  constructor: (privateProperty, @publicProperty) ->
    _privateProperty = privateProperty
    Class.count++

  # public methods
  # note that we use ':' to define public methods
  # naming convention for public members is camelCase
  publicMethod : (@publicProperty) ->

  getPrivateProperty : ->
    _privateProperty

  callPrivateMethod : (callback) ->
    _privateMethod callback
    return

  # singleton members
  @publicSingletonProperty : 0
  @publicSingletonMethod : (@publicSingletonProperty) ->

  @setPrivateSingletonProperty: (value) ->
    _privateSingletonProperty = value
    return

  @getPrivateSingletonProperty : ->
    _privateSingletonProperty

  @callPrivateSingletonMethod : (callback) ->
    _privateSingletonMethod callback
    return

module.exports = Class