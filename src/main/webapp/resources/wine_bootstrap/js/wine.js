/**
 * 
 */
console.log("Wine Module........");



var wineService = (function(){
	
	function requestWineList(callback) {
		console.log("request Wine List....")
		
	    var _wineTypeArr = [];     // 배열 초기화
		var _wineGrapeArr = [];
		var _wineRegionArr = [];
		var _wineCountryArr = [];
		var _wineStyleArr = [];
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		$("input[name='Grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val()); 
		})
		    
		$("input[name='Region']:checked").each(function(i) {
	    	_wineRegionArr.push($(this).val()); 
		})
		
		$("input[name='Country']:checked").each(function(i) {
	    	_wineCountryArr.push($(this).val()); 
		})
		
		$("input[name='WineStyle']:checked").each(function(i) {
	    	_wineStyleArr.push($(this).val()); 
		})

		var actionForm = $("#actionForm");
		var pageNum = actionForm.find("input[name='pageNum']").val();
		
		console.log("pageNum", pageNum)  	    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
		console.log("Wine Region", _wineRegionArr);
		console.log("Wine Country", _wineCountryArr);
		console.log("Wine Style", _wineStyleArr);
	    
	    $.ajax({
	        url: 'requestWineList'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
				pageNum: pageNum,
	        	wineTypeArr: _wineTypeArr,
				wineGrapeArr: _wineGrapeArr,
				wineRegionArr:_wineRegionArr,
				wineCountryArr:_wineCountryArr,
				wineStyleArr:_wineStyleArr,
				}
				
			, success : function(result, status, xhr) {
				console.log("update wine List")
				if (callback) {
					callback(result);
				}
			}
	    });

	};
	

	function requestTotalPageNum() {
		console.log("request TotalPageNum....")
		
	    var _wineTypeArr = [];     // 배열 초기화
		var _wineGrapeArr = [];
		var _wineRegionArr = [];
		var _wineCountryArr = [];
		var _wineStyleArr = [];
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })
		
		$("input[name='Grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val());     
	    })
		
		$("input[name='Grapes']:checked").each(function(i) {
	    	_wineRegionArr.push($(this).val());     
	    })
		
		$("input[name='Country']:checked").each(function(i) {
	    	_wineCountryArr.push($(this).val()); 
		})
		
		$("input[name='WineStyle']:checked").each(function(i) {
	    	_wineStyleArr.push($(this).val()); 
		})

		var actionForm = $("#actionForm");
		var totalPageNum = actionForm.find("input[name='totalPageNum']");
			    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
		console.log("Wine Region", _wineRegionArr);
		console.log("Wine Country", _wineCountryArr);
		console.log("Wine Style", _wineStyleArr);

	    
	    $.ajax({
	        url: 'getTotalPageNum'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
	        	wineTypeArr: _wineTypeArr,
				wineGrapeArr: _wineGrapeArr,
				wineRegionArr:_wineRegionArr,
				wineCountryArr:_wineCountryArr,
				wineStyleArr:_wineStyleArr
				}
				
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


	
