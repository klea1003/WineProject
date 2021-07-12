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
		var _wineRating;
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		$("input[name='wine_rating']:checked").each(function(i) {
			_wineRating = $(this).val();
		})

		$("input[name='grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val()); 
		})
		    
		$("input[name='region']:checked").each(function(i) {
	    	_wineRegionArr.push($(this).val()); 
		})
		
		$("input[name='country']:checked").each(function(i) {
	    	_wineCountryArr.push($(this).val()); 
		})
		
		$("input[name='wine_style']:checked").each(function(i) {
	    	_wineStyleArr.push($(this).val()); 
		})
		
		// price range
		var price_min = $( "#price_min" ).val();
		var price_max = $( "#price_max" ).val();
		console.log("priceMin", price_min);
		console.log("priceMax", price_max);
		
		// keyword
		var wine_keyword = $("input[name='wine_keyword']").val()
		console.log("keyword", wine_keyword);

		var actionForm = $("#actionForm");
		var pageNum = actionForm.find("input[name='pageNum']").val();
		
		console.log("pageNum", pageNum)  	    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
		console.log("Wine Region", _wineRegionArr);
		console.log("Wine Country", _wineCountryArr);
		console.log("Wine Style", _wineStyleArr);
		console.log("Wine Rating", _wineRating);
	    
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
				wineRating:_wineRating,
				priceMin: price_min,
				priceMax: price_max,
				wineKeyword: wine_keyword
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
		var _wineRating;
		
	    $("input[name='wine_type']:checked").each(function(i) {
	    	_wineTypeArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    })

		$("input[name='wine_rating']:checked").each(function(i) {
			_wineRating = $(this).val();
		})
		
		$("input[name='grapes']:checked").each(function(i) {
	    	_wineGrapeArr.push($(this).val());     
	    })
		
		$("input[name='region']:checked").each(function(i) {
	    	_wineRegionArr.push($(this).val());     
	    })
		
		$("input[name='country']:checked").each(function(i) {
	    	_wineCountryArr.push($(this).val()); 
		})
		
		$("input[name='wine_style']:checked").each(function(i) {
	    	_wineStyleArr.push($(this).val()); 
		})
		
		// price range
		var price_min = $( "#price_min" ).val();
		var price_max = $( "#price_max" ).val();
		console.log("priceMin", price_min);
		console.log("priceMax", price_max);
		
		// keyword
		var wine_keyword = $("input[name='wine_keyword']").val()
		console.log("keyword", wine_keyword);

		var actionForm = $("#actionForm");
		var totalPageNum = actionForm.find("input[name='totalPageNum']");
			    
	    console.log("Wine Type", _wineTypeArr);
		console.log("Wine Grape", _wineGrapeArr);
		console.log("Wine Region", _wineRegionArr);
		console.log("Wine Country", _wineCountryArr);
		console.log("Wine Style", _wineStyleArr);
		console.log("Wine Rating", _wineRating);
	    
	    $.ajax({
	        url: 'getTotalPageNum'
	        , type: 'get'
	        , dataType: "JSON"
	        , data: {
	        	wineTypeArr: _wineTypeArr,
				wineGrapeArr: _wineGrapeArr,
				wineRegionArr:_wineRegionArr,
				wineCountryArr:_wineCountryArr,
				wineStyleArr:_wineStyleArr,
				wineRating:_wineRating,
				priceMin: price_min,
				priceMax: price_max,
				wineKeyword: wine_keyword
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

var wineUtil = (function(){
	
	function starFromRating(inputRating) {
		outStr = ""
		if (inputRating >= 4.5){
			console.log("case 1")
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star-half'></i></span>"
		} else if (inputRating >= 4.0) {
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(1,1,1, 0.3)'><i class='fa fa-xl fa-star'></i></span>"
		} else if (inputRating >= 3.5) {
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star-half'></i></span>"
			outStr += "<span style='color:rgb(1,1,1, 0.3)'><i class='fa fa-xl fa-star'></i></span>"
		} else if (inputRating >= 3.0) {
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(156,22,49)' ><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(1,1,1, 0.3)'><i class='fa fa-xl fa-star'></i></span>"
			outStr += "<span style='color:rgb(1,1,1, 0.3)'><i class='fa fa-xl fa-star'></i></span>"
		} 
		
		return outStr
	};
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	return {
		starFromRating: starFromRating,
		numberWithCommas: numberWithCommas
	}
})();


	
