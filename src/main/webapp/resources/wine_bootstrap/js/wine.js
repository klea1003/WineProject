/**
 * 
 */
console.log("Wine Module........");



var wineService = (function(){
	
	function requestWineList(callback) {
		console.log("request Wine List....")
		
	    var _wineTypeArr = [];     // 배열 초기화
		var _wineGrapeArr = [];
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })
		$("input[name='Grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		var actionForm = $("#actionForm");
		var pageNum = actionForm.find("input[name='pageNum']").val();
		
		console.log("pageNum", pageNum)  	    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
	    
	    $.ajax({
	        url: 'requestWineList'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
				pageNum: pageNum,
	        	wineTypeArr: _wineTypeArr,
				wineGrapeArr: _wineGrapeArr}
				
			, success : function(result, status, xhr) {
				console.log("update wine List")
				if (callback) {
					callback(result);
				}
			}
	    });
	    
	}
	
	function requestTotalPageNum() {
		console.log("request TotalPageNum....")
		
	    var _wineTypeArr = [];     // 배열 초기화
		var _wineGrapeArr = [];
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })
		$("input[name='Grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		var actionForm = $("#actionForm");
		var totalPageNum = actionForm.find("input[name='totalPageNum']");
			    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
	    
	    $.ajax({
	        url: 'getTotalPageNum'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
	        	wineTypeArr: _wineTypeArr,
				wineGrapeArr: _wineGrapeArr}
				
			, success : function(result, status, xhr) {
				console.log("update TotalPageNum")
				
				console.log("received totalPageNum:" + result.totalPageNum);
				
				totalPageNum.val(result.totalPageNum);
				
			}
	    });
	}
	
	return {
		requestWineList : requestWineList,
		requestTotalPageNum: requestTotalPageNum
	};
	
})();


	
