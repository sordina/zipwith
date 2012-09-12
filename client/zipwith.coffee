
jQuery.fn.outer = () -> $( $('<div></div>').html(this.clone()) ).html()

Template.source.events =
	'keyup input.selector' : (e) -> Session.set('selector', $(e.target).val())
	'keyup input.url'      : (e) -> Queue.insert({url : $(e.target).val()})

Template.source.scrapes = () -> Scraped.find().map(filterme)

filterme = (item) ->

	code     = item.content
	selector = Session.get('selector') || "p"

	result = {url : "error", items : []}

	try
		result =
			url   : item.url
			items : $(code).find(selector).map (i,e) -> {html : $(e).outer() }
	catch error
		result =
			url   : "error"
			items : []

	window.res = result

	result
