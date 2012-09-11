
var urlUpdates = {
	'keypress input.url' : function (e) {
		if (typeof console !== 'undefined')
			console.log("You pressed the button " + e.keyCode);
	}
};

Template.left.events  = urlUpdates
Template.right.events = urlUpdates

var queue = {};

function pullQueues() {

	Meteor.http.get('asdf.com', function(e){
		console.log('interval' + e)
	})
}

Meteor.setInterval(pullQueues, 5000)
