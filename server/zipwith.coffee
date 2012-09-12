
Meteor.startup () ->
	console.log "Starting Application on Port 3000"
	Queue.remove({})
	Scraped.remove({})

processor = () ->
	console.log "Running Queue"
	Queue.find().forEach (item) ->
		console.log "Found Queue Item - " + item._id
		Queue.remove({url: item.url})
		if item and item.url and item.url.match(/^https?:\/\//)
			console.log "Found URL - " + item.url
			Meteor.http.get item.url, (error,r) ->
				console.log "URL - " + item.url + " fetched with response - " + error
				if r.content and not error
					console.log "Succesfully downloaded URL - " + item.url
					Scraped.insert({url : item.url, content: r.content})

Meteor.setInterval( processor, 2000 )
