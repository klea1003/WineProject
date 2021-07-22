/*!
* Start Bootstrap - Modern Business v5.0.2 (https://startbootstrap.com/template-overviews/modern-business)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-modern-business/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
var reviewService = (function() {

   function add(review, callback, error) {
      console.log("add reply...");

      $.ajax({
         type: 'post',
         url: '/reviews/new',
         data: JSON.stringify(reply),
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

      })
   } //add
   
   function getListRating(param, callback, error) {
	var wineNum = param.wineNum; 
	var page = param.page || 1;
	
	$.getJSON("/reviews/pages/" + wineNum + "/" + page + ".json",
		function(data) {
				
			if (callback) {
			   callback(data.reviewCnt, data.list);
			}
		}).fail(function(xhr, status, err) {
	if (error) {
		error();
		}
	});
}//getListRating

   
     return {
      add: add,
      getListRating:getListRating

   };
   })();