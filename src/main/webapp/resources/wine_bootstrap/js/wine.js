/**
 * 
 */
console.log("Wine Module........");



var wineService = (function(){
	
	function requestWineList(callback) {
		console.log("request Wine List....")
		
	    var _wineTypeArr = [];     // 배열 초기화
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		var actionForm = $("#actionForm");
		var pageNum = actionForm.find("input[name='pageNum']").val();
		
		console.log("pageNum", pageNum)  	    
	    console.log("Wine Type", _wineTypeArr);
	    
	    $.ajax({
	        url: 'requestWineList'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
				pageNum: pageNum,
	        	wineTypeArr: _wineTypeArr}
			, success : function(result, status, xhr) {
				console.log("update wine List")
				if (callback) {
					callback(result);
				}
			}
	    });
	    
	}
	
	return {
		requestWineList : requestWineList
	};
	
})();


	
