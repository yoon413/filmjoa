## 영화 리뷰 사이트(Movie Review) -개인 프로젝트


### 목적
---
* 영화의 정보를 간략하게 설명하고, 사용자들이 평점을 내리는 사이트를 만들자
* 간단한 게시판 기능을 넣어보자(기본 CRUD, 답변 구현)
* 스프링 시큐리티를 사용해서 로그인, 로그아웃 처리 구현
* AWS를 이용한 DB 관리(RDS), 배포 및 호스팅

### 개발 환경
---
> Front-End
* Bootstrap 4 (템플릿 구매 후 사용)
* Jquery 3

> Back-End
* Spring 5.0
* JDK 1.8
* Oracle 11g
* MyBatis 3.4
* Tomcat 8.5
* Maven 2.9

### 제작 기간 - 2020.02.03 ~ 2020.03.05 
---
> 1주차 (20.02.03 ~ 20.02.09)
* 02/03: 개발환경 설정 및 프로젝트 주제 설정.
* 02/04: 코로나 바이러스로 인한 스터디 중단. 개인프로젝트로 변경, Front-End 부분을 템플릿을 구매해서 사용하기로 결정.
* 02/05: 주제에 적합한 템플릿 선정, 사이트 전체 구조 계획, Oracle DB 모델 설계 및 생성.
* 02/06: 영화 등록 View (MovieSetting.jsp) 진행 => 영화 등록 Modal 및 등록 기능 완성.
* 02/07: 영화 등록 View (MovieSetting.jsp) 진행 => 페이징, Sort 처리 완성.
* 02/08: 영화 등록 View (MovieSetting.jsp) 진행 => 영화 등록, 수정, 삭제 Modal 구현 및 수정.
* 02/09: 영화 등록 View (MovieSetting.jsp) 완성 => 영화 수정시에 등록한 정보 불러오게 구현.

> 2주차 (20.02.10 ~ 20.02.16)
* 02/10: 메인 페이지 View (index.jsp) 완료 => 주제에 맞게 편집(최신 영화, 년간, 한국, 외국 영화 Best 5 보여주기).
* 02/11: 영화 정보 View (get.jsp) 진행 => IE, Edge에서 영화 이미지가 출력이 안되는 문제 확인.

         문제 원인: get으로 Parameter를 호출 시에 한글 및 빈칸이 있으면, Crome에서는 자동으로 인코딩 되지만, IE에서는
                   따로 설정을 해줘야 됨. 
         해결 방법: <c:url> 태그를 이용해서 파라미터를 인코딩 시켜줌.
        
* 02/12: 회원가입, 로그인 View (register.jsp, login.jsp) 완료 => 아이디 중복체크, 패스워드 , 이메일 유효성 검사.
* 02/13: 로그인, 로그아웃 처리 진행 => Spring Security 이용 .
* 02/14: 로그인, 로그아웃 이후 처리 완료 => 로그인 후에 원래 있던 페이지로 이동, 로그인 실패 시 메시지 출력.
* 02/15: 휴식
* 02/16: 영화 정보 View (get.jsp) 진행 => 리뷰 CRUD, 페이징 진행(Ajax로 구현).

         문제점: Ajax를 통해서 리뷰를 삭제 시에 405에러가 뜸.
         문제 원인: Spring Security에서는 Post방식으로 호출 시에 CSRF 공격 방지를 자동으로 하기 때문에 에러가 생김.
         해결 방법: Security-context에서 CSRF 공격 방지 기능을 막거나, POST 방식으로 전달 시에 CSRF 방지 토큰을 같이 전달.
         
> 3주차 (20.02.17 ~ 20.02.23)        
* 02/17: 영화 정보 View(get.jsp) 완료 => 해당 영화에 리뷰를 작성 시에는 리뷰 작성 창 숨기기, 수정, 삭제 버튼 보이게 하기.
* 02/18: 마이페이지 View (mypage.jsp, userInfo, withdrawal.jap) 완료 => 사용자가 작성한 리뷰 목록 출력, 삭제 기능, 정보 수정, 탈퇴 기능 구현.
* 02/19: header.jsp, footer.jsp, sidebar.jsp 완료.
* 02/20: 영화 리스트 View (movieList.jsp) 진행 => 정렬, 페이징 기능 구현.
* 02/21: 영화 리스트 View (movieList.jsp) 완료 => 장르를 checkbox로 검색(장르 3개까지)해서 정렬하는 기능 구현.
* 02/22: 메인 View (index.jsp) 검색 기능 완료 => 영화 제목을 입력하면, movieList.jsp로 이동 후 조회.
* 02/23: 공지사항 View (notice.jsp) 진행 => admin 계정만 CRUD 가능하게 구현, 나머지 사용자는 조회만 할 수 있게 진행.

> 4주차 (20.02.24 ~ 20.03.01)
* 02/24: 공지사항 View (notice.jsp, get.jsp, modify.jsp) 완료 => 검색 기능, 페이징 구현.
* 02/25: 자유게시판 View (article.jsp, get.jsp, modify.jsp) 진행 => 조회 페이지만 각자 사용하고, get.jsp, modify.jsp 같이 사용할 수 있게 진행.
* 02/26: 공지사항, 자유게시판 View (notice.jsp, article.jsp) => 답변 기능 및 계층형 조회 가능하게 진행.

         문제점: 답변 글이 원본 글 밑에 순서대로 정렬이 되지 않음.
         해결 방법: 인라인 뷰 안에 다시 한 번 원본, 그룹 번호 순으로 정렬시킴.

* 02/27: 구현된 기능들 보완 및 코드 재정리.
* 02/28: 프로젝트 배포 테스트 => War 파일로 Export 후에 Tomcat 서버에 배포.
* 02/29: AWS EC2 인스턴스 생성, RDS 생성(기존 DB와 연동)
* 03/01: AWS 서버 우분투에서 환경 설정 => Putty를 이용한 우분투 원격 접속, JDK 1.8 설치, Tomcat 8.5 설치

> 5주차 (20.03.02 ~ 20.03.05)
* 03/02: Filezillar를 이용한 서버쪽에 War 파일 전송 및 배포 테스트.

         문제점: 우분투에서의 배포 테스트 진행 시에 404 에러 발생.
         문제 원인: root-context.xml에서의 jdbc 경로와 id, password를 변경하지 않음.
         해결 방법: jdbc의 경로와 id, password를 RDS에서 생성한 엔드포인트, id, password로 변경.
         
* 03/03: 서버에서 프로젝트 배포 테스트 진행.

         문제점: 사이트가 정상적으로 작동은 되지만, 이미지가 출력이 안되는 문제 발견.
         문제 원인: 영화 이미지 업로드 시, 경로가 C:로 되있는 것을 서버쪽에 맞는 경로를 설정해야됨.
         해결 방법: /home/ubuntu/ 경로에 새롭게 upload 폴더 생성 후에 해당 경로로 이미지 업로드 변경.
         
* 03/04: 도메인, 호스팅 홈페이지를 이용해서 호스팅 진행 => 도메인 이름 구매 후, AWS의 Route53을 이용해서 DNS 서비스 완료.
* 03/05: 최종 마무리

### filmjoa 패키지 구조
---
<img src="https://user-images.githubusercontent.com/61972539/76237974-73fd5f00-6272-11ea-9c27-18a40c137f7e.png" width="600" height="600">

### filmjoa 데이터베이스 구조
---
<img src="https://user-images.githubusercontent.com/61972539/76238144-c179cc00-6272-11ea-93c2-2395a556f10e.PNG" width="500" height="500">

### 주요 기능
---
* 회원가입

```javascript
//정규 표현식으로 표현한 조건
var idCondition = /^[a-z0-9]{4,12}$/;
var mailCondition = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var pwCondition = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	  
//아이디 중복값 처리
var idOverlap = 1;
	  
//등록 처리
$("#register").on("click", function(e) {
         e.preventDefault();
         var userId =  $("#user_id").val();
         var userEmail = $("#user_email").val();
         var userPw = $("#user_pw").val();
         var userPw2 = $("#user_pw2").val();
         if(userId.length < 1 || userEmail.length <1 || userPw.length <1 || userPw2.length <1 
         || idCondition.test(userId)==false || mailCondition.test(userEmail)==false 
                  || pwCondition.test(userPw)==false || userPw != userPw2 || idOverlap == 0){
		         alert("회원 정보를 올바르게 입력하세요");
		         console.log(idOverlap);
			         } else {
				         $("form").submit();
			         }
	                  });
	  
//아이디 중복 예외 처리(포커스 잃을 때)
$("#user_id").blur(function(){
         var user_id = $("#user_id").val();
		
         $.ajax({
	          url : "/main/idCheck?user_id=" + user_id,
	          type : "get",
	          success : function(data) {
		 console.log("1= 중복ok // 0 = 중복x : " +data);
                 // 아이디가 이미 존재할 경우
		if (data == 1) {
		         $("#userIdOverlap").html("중복된 아이디입니다.");
			$("#userIdOverlap").css("color", "red");
			idOverlap = 0;
                          // 아이디가 존재하지 않는 경우
			else {
			         if(idCondition.test(user_id)){
			         $("#userIdOverlap").html("");
				idOverlap = 1;
				} else if(user_id ==""){
				         $("#userIdOverlap").html("아이디를 입력해주세요.");
				         $("#userIdOverlap").css("color", "red");
				} else {
					$("#userIdOverlap").html("아이디는 소문자, 숫자로 4~12자리로 입력.")
					$("#userIdOverlap").css("color", "red");
                                          }
					  
				}
			  },
			  error : function() {
				  console.log("실패");
			  }
		  }); //ajax end
	  });
	  
//이메일 유효성 체크
$("#user_email").blur(function(){
         var user_email = $("#user_email").val();
	if(mailCondition.test(user_email)){
	         $("#userEmailCondition").html("");			
		return;
	} else {
	         $("#userEmailCondition").html("이메일을 올바르게 입력.");
		$("#userEmailCondition").css("color", "red");	 
	}
								  
});
	 
//비밀번호 검사
$("#user_pw").blur(function(){
         var user_pw = $("#user_pw").val();
         
         if(pwCondition.test(user_pw)){
	$("#userPwCondition").html("");			  
	return;
	} else {
	         $("#userPwCondition").html("대,소,특문자,숫자 포함 8자리 이상 입력.");
		$("#userPwCondition").css("color", "red");			  
	}
								  
});

//비밀번호 확인
$("#user_pw2").blur(function(){
         var user_pw = $("#user_pw").val();
	var user_pw2 = $("#user_pw2").val();
                    
	if(user_pw2 == user_pw){
	         $("#userPw2Condition").html("");			  			 
	         } else {
		         $("#userPw2Condition").html("비밀번호가 일치하지 않습니다.");
			$("#userPw2Condition").css("color", "red");			  
	             }
								  
	});

```

```java
// 회원 아이디 중복체크
@GetMapping(value = "/idCheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
public int idCheck(@RequestParam("user_id") String user_id) {
	log.info("User id: " + user_id);
	return userService.userIdCheck(user_id);
}
```

<img src="https://user-images.githubusercontent.com/61972539/76312255-fab74800-6315-11ea-8ad8-11d77ff312f7.gif" width="250" height="400">
아이디 유효성 검사

<img src="https://user-images.githubusercontent.com/61972539/76312259-fb4fde80-6315-11ea-9bc7-fc81d7e4681b.gif" width="250" height="400">
이메일 유효성 검사

<img src="https://user-images.githubusercontent.com/61972539/76312260-fbe87500-6315-11ea-8402-5d44488b38b1.gif" width="250" height="400">
비밀번호 유효성 검사


* 리뷰 조회 함수
```javascript
 //리뷰 페이징 및 조회처리 
function showList(page){
	var mnoValue = '<c:out value = "${getMovieInfo.mno}"/>';
      	$.getJSON("/review/pages/" + mnoValue + "/" + page + ".json", function(data){
      		var list = data.reviewList;
  		if(page == -1) {
  			pageNum = Math.ceil(data.replyCnt/10.0);
  		    	showList(pageNum);
  		 }
  		    	  	
  		 var str="";	       		
  		 for(var i=0; i<list.length; i++){
	      	 	console.log(data)
	                str +=  "<li class='single-reviews'>"
	                str +=  "<div class='reviews-autor'>"             
	                str +=  "<img class='reviews-avatar' src='/resources/main/img/avatar.jpg' alt=''>"
	                str +=  "<span id='reviewTitle' class='reviews-title'>"+list[i].review_title +"</span>"
	               	str +=  "<span class='reviews-date'>"+displayTime(list[i].updateDate)+"<strong id='id' data-								user='"+list[i].user_id+"'>"+list[i].user_id+"</strong></span>"
	                str +=  "<span class='reviews-rating'><i class='fa fa-star'></i>"+list[i].star_score+"</span>"
	                str +=  "</div>"
	                str +=  "<p class='reviews-text'>"+list[i].review_content+"</p>"		               
	    	   	str +=  "</li>"
	    	   	
			//자신이 작성한 리뷰가 존재하고, 작성한 리뷰일때
	    	   	if(list[i].user_id == loginedUserId){
	    	   		getTitle = list[i].review_title;	    	   	
	    	      		getContent = list[i].review_content;
	    	      		star_score = list[i].star_score;
	    	   		str +="<button type='button' class='btn btn-outline-info btn-sm' id='reviewMod' data-toggle='modal' 						data-target='#myModal'>수정</button>"                                              	
	    	   		str +="<button type='button' class='btn btn-outline-danger btn-sm' id='reviewDelete'>삭제</button>"    
	    	   		
				// 리뷰 등록 창은 숨김
	    	   		$("#revewFormDiv").hide();
	    	   	}
			// 작성 리뷰가 없을 경우
	    	   	if (list.length == 0){
	      			$("#revewFormDiv").show();
	      			$("#review_title").val("");
            			$("#review_content").val("");
            			$('input:radio[name=modScore]:input[value='+star_score +']').prop('checked', false);
	      		}
	    	   		
	         }//end for
  		 $(".reviews-box").html(str);
  		 showReviewPage(data.replyCnt);
  	});//end function
  		      
}//end showList
```
```java
// 리뷰 목록 가져오기
@GetMapping(value = "/pages/{mno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
	MediaType.APPLICATION_JSON_UTF8_VALUE })
public ResponseEntity<ReviewPageDTO> getList(@PathVariable("page") int page, @PathVariable("mno") Long mno) {
	log.info("영화 번호: " + mno);
	Criteria cri = new Criteria(page, 10);
	return new ResponseEntity<>(reviewService.getListPage(cri, mno), HttpStatus.OK);

}
```
* 리뷰 등록
```javascript
//리뷰등록
$("#registerBtn").on("click", function(e){
	e.preventDefault();
      	var csrfHeaderName = "${_csrf.headerName}";
      	var csrfTokenValue = "${_csrf.token}";
      			
      	//json 데이터 타입으로 직렬화시켜서 변수에 담음
      	var formData = $("#reviewForm").serializeObject();
      			
      	//비동기 처리
      	$.ajax({
      		type : 'post',
      		url : '/review/new',
      		data : JSON.stringify(formData),
      		contentType : "application/json; charset=utf-8",
      		beforeSend: function(xhr){
      			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      		},
      		success : function(result, status, xhr) {	
			showList(-1)
      		},
      		error : function(xhr, status) {
      			alert("리뷰 제목, 내용, 평점을 정확히 입력해 주세요.")
      		}
      	})
});
```
```java
// 리뷰 생성
@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
public ResponseEntity<String> create(@RequestBody ReviewVO review) {
	log.info("Review Info: " + review);
	int insertCount = reviewService.RegisterReview(review);
	if (insertCount == 1) {
		reviewService.avgReivewScore(review.getMno());
		return new ResponseEntity<>("success", HttpStatus.OK);
	} else {
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
```
<img src="https://user-images.githubusercontent.com/61972539/76321209-0d854900-6325-11ea-9a6b-69cac72b214f.gif" width="500" height="300">

* 리뷰 수정


```javascript
//수정 버튼 누를 시 등록한 내용 가져오기
$(document).on("click", "#reviewMod" ,function(e){
	console.log(getTitle)
    		
	$("#titleName").val(getTitle);
    	$("#titleContent").val(getContent);
    	$('input:radio[name=modScore]:input[value='+star_score +']').attr("checked", true)
    			
});
      		
//리뷰 수정
$(document).on("click", "#modReviewBtn" ,function(e){
	var modalReviewTitle = $("#titleName").val();
	var modalReviewContent = $("#titleContent").val();
	var modalReviewScore = $('input[name=modScore]:checked').val();
	console.log(modalReviewScore)
      	$.ajax({
    		type : 'post',
    		url : '/review/modify/' + mnoValue + "/" + loginedUserId,
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    		},
    		data: JSON.stringify({mno:mnoValue, user_id:loginedUserId, review_title: modalReviewTitle,
    			review_content: modalReviewContent, star_score: modalReviewScore }),
    		contentType : "application/json; charset=utf-8",
    		success : function(result, status, xhr) {
    			if (result) {
    				showList(pageNum)	
    			}
    		},
    		error : function(xhr, status, er) {
    			if (error) {
    				alert("리뷰 수정이 되지 않았습니다.")	
    			}
    		}
    	}); //ajax end
});
```
```java
// 리뷰 수정
@PostMapping(value = "/modify/{mno}/{user_id}", consumes = "application/json", produces = {
	MediaType.TEXT_PLAIN_VALUE })
@Transactional
public ResponseEntity<String> modify(@RequestBody ReviewVO review, @PathVariable("mno") Long mno,
	@PathVariable("user_id") String user_id) {

	log.info("Review Info: " + review);
	log.info("영화 번호: " + mno);
	review.setMno(mno);
	review.setUser_id(user_id);
	if (reviewService.updateReview(review) == 1) {
		reviewService.avgReivewScore(mno);
		return new ResponseEntity<>("success", HttpStatus.OK);
	} else {
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
```
<img src="https://user-images.githubusercontent.com/61972539/76321217-0fe7a300-6325-11ea-92f3-83dbc1b1365f.gif" width="500" height="300">

* 리뷰 삭제

```javascript
//리뷰삭제
$(document).on("click", "#reviewDelete" ,function(e){
 			
	$.ajax({
		type : 'post',
    		url : '/review/' + mnoValue + "/" + loginedUserId,
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    		},
    		data: JSON.stringify({mno:mnoValue, user_id:loginedUserId}),
    		contentType : "application/json; charset=utf-8",
    		success : function(result, status, xhr) {
    			if (result) {
    				showList(pageNum)
    				$("#revewFormDiv").show();
    				$("#review_title").val("");
                		$("#review_content").val("");
                		$('input:radio[name=modScore]:input[value='+star_score +']').prop('checked', false);
    			}
    		},
    		error : function(xhr, status, er) {
    			if (error) {
    				alert("리뷰 삭제가 되지 않았습니다.")
    			}
    		}
	});
	
});
```
```java
// 리뷰 제거
@PostMapping(value = "{mno}/{user_id}", produces = { MediaType.TEXT_PLAIN_VALUE })
@Transactional
public ResponseEntity<String> remove(@PathVariable("mno") Long mno, @PathVariable("user_id") String user_id) {
	log.info("영화 번호: " + mno);
	log.info("회원Id: " + user_id);
	if (reviewService.deleteReview(user_id, mno) == 1) {
		reviewService.avgReivewScore(mno);
		return new ResponseEntity<>("success", HttpStatus.OK);
	} else {
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
```

<img src="https://user-images.githubusercontent.com/61972539/76325421-9f438500-632a-11ea-8454-2871112caad7.gif" width="500" height="300">

* 영화 등록

```javascript
// 모달 form
var formObj = $("form[role='form']");

//영화 정보 등록
$("#uploadMovie").on("click", function(e){
	e.preventDefault();
	var str = "";
	
	//이미지 미리보기 ul
	 $(".uploadResult ul li").each(function(i, obj){
		var jobj = $(obj);							         
		str += "<input type='hidden' name='titleImage.img_name' value='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name='titleImage.img_path' value='"+jobj.data("path")+"'>";
	});
	
	var genre = [];
	var total_cnt = 0;
	
	// 장르 선택 설정(checkbox) => 무조건 1개의 checkbox는 선택이 되어야 함.
	$("input[name='movieGenre']:checked").each(function(){
		if(this.checked){
			genre[total_cnt] = this.value;
			total_cnt ++ ;
		}
	});
	switch (genre.length){				
		case 1 : 	str += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
				str += "<input type='hidden' name='genre2' value=''>";
				str += "<input type='hidden' name='genre3' value=''>";
				break;
		case 2 :	str += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
			 	str += "<input type='hidden' name='genre2' value='"+genre[1]+"'>";
				str += "<input type='hidden' name='genre3' value=''>";	
				break;
		case 3 : 	str += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
				str += "<input type='hidden' name='genre2' value='"+genre[1]+"'>";
		 		str += "<input type='hidden' name='genre3' value='"+genre[2]+"'>";
		 		break;
		}
						
	if(genre.length == 0 || genre.length > 3 ){
		alert("장르를 알맞게 선택하세요(최소 1개, 최대3개)");
	} else if($("#nation").val() == ''){
		alert("영화 국가를 선택하세요")
	} else if($("#title").val()== '' || $("#director").val()== '' || $("#plot").val()== ''){
		alert("제목, 감독, 줄거리를 제대로 입력하세요.")
	} else if($("#actor1").val()== ''){
		alert("최소 한 명의 출연 배우를 입력하세요.")
	} else if($("#time").val()== '' || $("#time").val().indexOf("분") == -1){
		alert("상영 시간을 해당 형식에 맞게 입력하세요.")
	} else if($("#release").val()== '' || $("#release").val().length != 8 ){
		alert("출시일을 해당 형식에 맞게 입력하세요.")
	} else if ($("#trailer").val() == '' || $("#thumbnail_path").val() == '' ){
		alert("트레일러 주소, 썸네일 이미지 주소를 입력하세요.")
	} else if (!$("#movieImage").val()) {
		alert ("타이틀 이미지를 선택해주세요.")
	} else if (! $('input[name="age"]:checked').val()){
		alert("시청 연령을 선택해주세요.")
	} else{
		formObj.append(str).submit();
	}
					    
});
```
```javascript
//영화 타이틀 이미지 첨부 기능
$("#movieImage").change(function(e) {
					
	var formData = new FormData();
	var inputImg1 = $("input[name='uploadImg']");												var movieImg1 = inputImg1[0].files;
																		if(!checkExtension(movieImg1[0].name, movieImg1[0].size)) {
		return false;
	} else{
		formData.append("uploadFile", movieImg1[0]);
	}
	
	$.ajax({
		url : '/admin/uploadMovieImage',
		processData : false,
		contentType : false,
		data : formData,
		dataType: "json",
		type : 'POST',
		beforeSend: function(xhr){
	      	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success : function(result) {
			console.log(result);
			showImage(result);
		}
	}); end ajax
});
```
```java
//영화 이미지 첨부 미리보기
@GetMapping("/showImage")
@ResponseBody
	public ResponseEntity<byte[]> showImage(String img_name) {
	log.info("fileName: " + img_name);
	File file = new File("/home/ubuntu/upload/movie/" + img_name);
		
	ResponseEntity<byte[]> result = null;
		
	try {
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", Files.probeContentType(file.toPath()));
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return result;
	}
//영화 이미지 저장, 폴더 생성
@PostMapping(value= "/uploadMovieImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
@ResponseBody
public ResponseEntity<List<ImageDTO>> uploadMoviePost(MultipartFile[] uploadFile) {
		
	List<ImageDTO> list = new ArrayList<>();
	log.info("update image....");
	//업로드 경로 설정
	String uploadFolder = "/home/ubuntu/upload/movie/";
	for (MultipartFile multipartFile : uploadFile) {

		ImageDTO imageDTO = new ImageDTO();
		tring uploadFileName = multipartFile.getOriginalFilename();

		// IE has file path
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
		log.info("only file name: " + uploadFileName);
		imageDTO.setImg_name(uploadFileName);
			
		// 폴더 생성(영화 이름)
		File uploadPath = new File (uploadFolder, uploadFileName.substring(0,uploadFileName.lastIndexOf(".")));
		if ( uploadPath.exists() == false) {
			log.info(uploadPath);
			uploadPath.mkdir();
		}
		try {
			File saveFile = new File(uploadPath, uploadFileName);
			multipartFile.transferTo(saveFile);
				
			imageDTO.setImg_path(uploadFileName.substring(0,uploadFileName.lastIndexOf(".")));
			if(checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 360, 360);
				thumbnail.close();
			}
				list.add(imageDTO);
			} catch (Exception e) {
			
			log.error(e.getMessage());
			
			} // end catch

		} // end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}

//이미지 체크 메서드
private boolean checkImageType(File file) {
	try {
		String contentType = Files.probeContentType(file.toPath());
		return contentType.startsWith("image");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}	
	
```
<img src="https://user-images.githubusercontent.com/61972539/76329506-031c7c80-6330-11ea-8767-08ded7c8cb56.gif" width="500" height="600">
