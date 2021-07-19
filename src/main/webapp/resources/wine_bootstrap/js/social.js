console.log("social....js");

var socialService = (function() {

	function add(social, callback,error) {

		console.log(" add social.........");

		$.ajax({
			type: 'post',
			url: '/social/following',
			data: JSON.stringify(social),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function remove(social, callback,error) {

		console.log(" remove social.........");

		$.ajax({
			type: 'post',
			url: '/social/unfollowing',
			data: JSON.stringify(social),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	return {
		add: add,
		remove: remove
	};

})(); 