<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
              
       
<!-- Movie List Area Start -->
<section class="filmoja-movie-list-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-3">
            	<div class="list-sidebar">                                         
                	<!-- Single Widget Start -->
                	<div class="single-sidebar-widget">               	                   	
                        <h3 class="sidebar-widget-title">by Genres:</h3>
                        	<ul>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox" name="movieGenre" id="Action" value="Action"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Action'}">checked</c:if>/>
                              		<label for="Action"><span></span>액션</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox" name="movieGenre" id="Comedy" value="Comedy" 
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Comedy' || pageMaker.cri.genreList[1] == 'Comedy' }">checked</c:if>/>
                              		<label for="Comedy"><span></span>코미디</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="SF" value="SF"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'SF' || pageMaker.cri.genreList[1] == 'SF' || 
                              			pageMaker.cri.genreList[2] == 'SF' }">checked</c:if>/>
                              		<label for="SF"><span></span>SF</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Adventure" value="Adventure" 
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Adventure' || pageMaker.cri.genreList[1] == 'Adventure' || 
                              			pageMaker.cri.genreList[2] == 'Adventure' }">checked</c:if>/>
                              		<label for="Adventure"><span></span>모험</label>
                           		</li>
                           		<li class="checkbox">
                              	<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Drama" value="Drama"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Drama' || pageMaker.cri.genreList[1] == 'Drama' || 
                              			pageMaker.cri.genreList[2] == 'Drama' }">checked</c:if> />
                              		<label for="Drama"><span></span>드라마</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Fantasy" value="Fantasy"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Fantasy' || pageMaker.cri.genreList[1] == 'Fantasy' || 
                              			pageMaker.cri.genreList[2] == 'Fantasy' }">checked</c:if> />
                              		<label for="Fantasy"><span></span>판타지</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="historical" value="historical"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'historical' || pageMaker.cri.genreList[1] == 'historical' || 
                              			pageMaker.cri.genreList[2] == 'historical' }">checked</c:if> />
                              		<label for="historical"><span></span>시대극</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="animation" value="animation"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'animation' || pageMaker.cri.genreList[1] == 'animation' || 
                              			pageMaker.cri.genreList[2] == 'animation' }">checked</c:if> />
                              		<label for="animation"><span></span>애니메이션</label>
                           		</li>
                            	<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="thriller" value="thriller" 
                              		<c:if test="${pageMaker.cri.genreList[0] == 'thriller' || pageMaker.cri.genreList[1] == 'thriller' || 
                              			pageMaker.cri.genreList[2] == 'thriller' }">checked</c:if>/>
                              		<label for="thriller"><span></span>스릴러</label>
                          	 	</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="War" value="War"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'War' || pageMaker.cri.genreList[1] == 'War' || 
                              			pageMaker.cri.genreList[2] == 'War' }">checked</c:if> />
                              		<label for="War"><span></span>전쟁</label>
                           		</li>
                           		<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Horror" value="Horror"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Horror' || pageMaker.cri.genreList[1] == 'Horror' || 
                              			pageMaker.cri.genreList[2] == 'Horror' }">checked</c:if> />
                              		<label for="Horror"><span></span>공포</label>
                           		</li>
                            	<li class="checkbox">
                              		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Mystery" value="Mystery"
                              		<c:if test="${pageMaker.cri.genreList[0] == 'Mystery' || pageMaker.cri.genreList[1] == 'Mystery' || 
                              			pageMaker.cri.genreList[2] == 'Mystery' }">checked</c:if> />
                              		<label for="Mystery"><span></span>미스터리</label>
                           		</li>
                           		<li class="checkbox">
                           	 		<input class="checkbox-spin" type="checkbox"	name="movieGenre" id="Romance" value="Romance"
                           	 		<c:if test="${pageMaker.cri.genreList[0] == 'Romance' || pageMaker.cri.genreList[1] == 'Romance' || 
                              			pageMaker.cri.genreList[2] == 'Romance' }">checked</c:if> />
                          	 		<label for="Romance"><span></span>멜로/로맨스</label>
                           		</li>
                        	</ul>
                        	<input type="button" id="genreSearchBtn" value="검색">                       	
                        	<!-- 장르 Form  End-->
                    	</div>
                  		<!-- Single Widget End -->              
               		</div>
               </div>
               
               <div class="col-lg-9">
               		<!-- 영화 정렬 처리 -->
               		<div class="browse-option-box margin-top">
                    	<div class="total-item-show">
                        	<p>총 ${movieCnt} 개의 영화가 등록되어 있습니다.</p>
                     	</div>
                     	<div class="total-item-show sorter">
                        	<p>Sort by:</p>
                        	<select id="sortMovie">
                           		<option value="titleAsc" 
                           			<c:if test="${pageMaker.cri.type == 'titleAsc'}">selected</c:if>>제목순(올림차순)</option>
                           		<option value="titleDesc"
                           			<c:if test="${pageMaker.cri.type == 'titleDesc'}">selected</c:if>>제목순(내림차순)</option>
                           		<option value="releaseAsc"
                           			<c:if test="${pageMaker.cri.type == 'releaseAsc'}">selected</c:if>>출시일순(올림차순)</option>
                           		<option value="releaseDesc"
                           			<c:if test="${pageMaker.cri.type == 'releaseDesc'}">selected</c:if>>출시일순(내림차순)</option>
                        	</select>
                     	</div>
                  	</div>
                  	<!-- 영화 정렬 처리 End -->
                  	<!--  영화 정보 목록 -->
                  	<div class="movie-grid-box">
                    	<div class="row" id="movieList">
                     		<c:forEach items="${movie}" var="movie">
                     			<c:url value="/main/img" var="img">
            						<c:param name="img_path" value="${movie.imageVO.img_path}"/>
            						<c:param name="img_name" value="${movie.imageVO.img_name}"/>            		
           						</c:url>
                        		<div class="col-lg-6">
                           			<div class="single-movie-list movie-grid-layout">
                              			<div class="single-movie-list-left">                                
                                 			<img src="${img}" alt="top-movies" />                               
                              			</div>
                              			<div class="single-movie-list-right">
                                 			<h3><a href="/main/get?mno=${movie.mno}">${movie.title}</a></h3>
                                 				<p class="list-genre">
                                 					${movie.genre1}
                              						<c:if test='${movie.genre2 != null}'>
                              							, ${movie.genre2}
                              						</c:if>
                              						<c:if test='${movie.genre3 != null}'>
                              							, ${movie.genre3}
                              						</c:if>
								 				</p>
                                 				<ul>
                                    				<li class="rating"><i class="fa fa-star"></i>${movie.avg_score}</li>                                    
                                    				<li class="dsc">${movie.age}</li>
                                 				</ul>
                                 				<div class="movie-details-thumbs">
                                   		 		<ul>
                                       				<li>
                                          				<i class="fa fa-eye"></i>${movie.view_cnt}
                                       				</li>
                                    			</ul>
                                 			</div>
                                 			<div class="movie-list-info">
                                    			<div class="list-info-left">
                                       				<p>감독: <span>${movie.director}</span></p>
                                       				<p>개봉일: <span>${movie.release}</span></p>
                                    			</div>
                                    			<div class="top-action">
                                       				<a href="${movie.trailer}" class="popup-youtube"><i class="fa fa-play"></i> Watch Trailer</a>
                                    			</div>
                                 			</div>
                              			</div>
                           			</div>
                        		</div>
                       		</c:forEach>
                     	</div>
                     	<!-- End Row -->
                  	</div>
                  	<!--  영화 정보 목록  End -->
                  <!-- 페이징 -->
                  <div class="row">
              		 <div class="col-md-12" >
                 		 <div class="pagination-box-row responsive-pag margin-top">
                     		 <ul class="pagination">
                     		 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">                     	                     
                        		<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "active":""} >
                       			<a href="${num}">${num}</a></li>
                      		 </c:forEach>
                      		 <c:if test="${pageMaker.next}">
                        		<li><a href="${pageMaker.endPage +1}"><i class="fa fa-angle-double-right"></i></a></li>
                        	</c:if>
                     		</ul>
                 	 	 </div>
               		</div>
           		</div>
           		<!--  페이징 End  -->
           		<form id='actionForm' action="/main/movieList" method='get'>
					<input type='hidden' name='searchKeyword' value='${pageMaker.cri.searchKeyword}'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='${pageMaker.cri.type}'>	
					<input type='hidden' name='genreList' value='${pageMaker.cri.genreList}'>
				</form>	            
        	</div>
    	</div>
	</div>
</section>
<!-- Movie List Area End -->
       
<script>
	var actionForm = $("#actionForm");
		
		$(document).ready(function(){
    	
		console.log('${pageMaker.cri.genreList}');

		//페이징 처리
	  	 $(".paginate_button a").on("click",function(e) {

			e.preventDefault();

			actionForm.find("input[name='pageNum']")
				.val($(this).attr("href"));			
			
			$("input[name=movieGenre]:checked").each(function(i){

				genre.push($(this).val());

				});
			
			actionForm.find("input[name='searchKeyword']").val();
			actionForm.find("input[name='genreList']").val(genre);	
			actionForm.submit();
		});
      
       //정렬 처리
	   $("#sortMovie").change(function(e){
			var sortMovie = $("#sortMovie option:selected").val();
			
			console.log(sortMovie);
			
			$("input[name=movieGenre]:checked").each(function(i){

				genre.push($(this).val());

				});
			
			actionForm.find("input[name='pageNum']").val("1");
			actionForm.find("input[name='type']").val(sortMovie);
			actionForm.find("input[name='genreList']").val(genre);	
			actionForm.find("input[name='searchKeyword']").val();	
			actionForm.submit();
			
		});
       
       //장르 체크박스 처리
	   var genre = [];

		$("#genreSearchBtn").on("click", function(e){
			
			$("input[name=movieGenre]:checked").each(function(i){

				genre.push($(this).val());

			});					
			actionForm.find("input[name='pageNum']").val("1");	
			actionForm.find("input[name='genreList']").val(genre);	
			if($("input[name=movieGenre]:checked").length < 1){
				actionForm.find("input[name='searchKeyword']").val("");
			}
			actionForm.submit();
		});
		
		
			
       }); 
       
       </script>
<%@include file="../includes/footer.jsp"%>

