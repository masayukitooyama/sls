Ajax = class @Ajax

  _request = (args) ->
    $.ajax({
      url: args.url
      type: args.type
      dataType: "json"
      contentType: 'application/json',
      data: args.data
      success: (json, textStatus, xhr)->
				args.success(json, textStatus, xhr)

			error: (err, json)->
				args.error(err.responseJSON, err.status)
		})

  _post = (args)->
		args.type = "POST"
		_request(args)

	_get = (args)->
		args.type = "GET"
		_request(args)

	_put = (args)->
		args.type = "PUT"
		_request(args)

	_delete = (args)->
		args.type = "DELETE"
		_request(args)

  # --------------------------------
  # Book
  # --------------------------------
  @getBooks: (args) ->
    args.url = "/api/book"
    _get(args)

  @createBook: (args) ->
    args.url = "/api/book"
    _post(args)
