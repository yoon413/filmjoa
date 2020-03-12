console.log("Reply Module........");

var replyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

//	function getList(param, callback, error) {
//
//		var bno = param.bno;
//		var page = param.page || 1;
//
//		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
//				function(data) {
//					if (callback) {
//						callback(data);
//					}
//				}).fail(function(xhr, status, err) {
//			if (error) {
//				error();
//			}
//		});
//	}
	
	

	function getList(mno, page, callback, error) {

	   
	    
	    $.getJSON("/movie/pages/" + mno + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	            callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }

	
	function remove(mno, user_id, callback, error) {
		$.ajax({
			type : 'post',
			url : '/movie/' + mno + "/" + user_id,
			data: JSON.stringify({mno:mno, user_id:user_id}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	
	//리뷰삭제
		$(document).on("click", "#reviewDelete" ,function(e){
			
			var mnoValue = '<c:out value="${getMovieInfo.mno}"/>';
			
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$.ajax({
				type : 'post',
				url : '/movie/' + mnoValue + "/" + loginedUserId,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: JSON.stringify({mno:mno, user_id:user_id}),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (result) {
					//리뷰 조회 리스트
						$(".reviews-box").empty();
						var mnoValue = '<c:out value = "${getMovieInfo.mno}"/>';
				      	var page = 1;
				      	var str="";
				      	$.getJSON("/movie/pages/" + mnoValue + "/" + page + ".json", function(data){
				      		var list = data.reviewList;
				      		
				      		
				      		for(var i=0; i<list.length; i++){
				      			console.log(list[i].user_id == loginedUserId)
				                str +=  "<li class='single-reviews'>"
				                str +=  "<div class='reviews-autor'>"             
				                str +=  "<img class='reviews-avatar' src='/resources/main/img/avatar.jpg' alt=''>"
				                str +=  "<span id='reviewTitle' class='reviews-title'>"+list[i].review_title +"</span>"
				                str +=  "<span class='reviews-date'>"+list[i].regdate+"<strong>"+list[i].user_id+"</strong></span>"
				                str +=  "<span class='reviews-rating'><i class='fa fa-star'></i>"+list[i].star_score+"</span>"
				                str +=  "</div>"
				                str +=  "<p class='reviews-text'>"+list[i].review_content+"</p>"		               
				    	   		str +=  "</li>"
				    	   		if(list[i].user_id == loginedUserId){
				    	   			$("#revewFormDiv").hide();
				    	   		str +="<button type='button' class='btn btn-outline-danger btn-sm' id='reviewDelete'>삭제</button>"                                              		
		                		} else {
		                			
		                			$("#revewFormDiv").show();
		                			$("#review_title").val("");
		                			$("#review_content").val("");
		                		}
				    	   		
				                }
				      		$(".reviews-box").append(str);
				      		
				      	});
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						
					}
				}
			});
			
			
				
			});
	
	
	
	
	
	
	
	
	function update(reply, callback, error) {

		console.log("RNO: " + reply.rno);

		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	;

	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};

})();
