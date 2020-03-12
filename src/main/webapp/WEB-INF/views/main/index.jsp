<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      
    
<!-- 최신 등록 영화 -->
<section class="filmoja-slider-area fix">
	<div class="filmoja-slide owl-carousel">
    	<c:forEach items="${latestMovie}" var="latestMovie">          		
        	<div class="filmoja-main-slide slide-item" style="background: url(${latestMovie.thumbnail_path})" >           	
            	<div class="filmoja-main-caption">
                	<div class="filmoja-caption-cell">
                    	<div class="container">
                        	<div class="row">
                           		<div class="col-md-12">
                              		<div class="slider-content-holder">
                                 		<div class="slider-text">
                                    		<h4><c:out value='${latestMovie.genre1}'/>
                              				<c:if test='${latestMovie.genre2 != null}'>
                              					, <c:out value='${latestMovie.genre2}'/>
                              				</c:if>
                              				<c:if test='${latestMovie.genre3 != null}'>
                              					, <c:out value='${latestMovie.genre3}'/>
                              	        	</c:if>
                              	    		</h4>
                                    		<h2><c:out value='${latestMovie.title}'/></h2>
                                    		<p class="release-slider">release on: <c:out value='${latestMovie.release}'/></p>
                                 		</div>
                                 		<div class="slider-play">
                                    		<a class="popup-youtube" href="<c:out value='${latestMovie.trailer}'/>">
                                    			<i class="fa fa-play"></i> watch trailer
                                    		</a>
                                 		</div>
                              		</div>
                           		</div>
                        	</div>
                     	</div>
                  	</div>
               	</div>              
            </div>
      	</c:forEach> 
	</div>
</section>
<!-- 최신 등록 영화 End -->
       
        
<!-- 2019-2020년 중에 평점 높은 영화 Best5 -->
<section class="filmoja-top-movies-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="filmoja-heading">
                	<h2>Best-Five :<span> 2019 - 2020</span></h2>
                </div>
            </div>
        </div>
        <div class="row">
        	<div class="col-md-12">
            	<div class="top-movie-slider owl-carousel">                    
                	<c:forEach items="${yearMovie}" var="yearMovie">
                    	<c:url value="/main/img" var="img">
            				<c:param name="img_path" value="${yearMovie.imageVO.img_path}"/>
            				<c:param name="img_name" value="${yearMovie.imageVO.img_name}"/>            		
            			</c:url>
                     	<div class="single-top-movie">
                        	<div class="top-movie-wrap">
                           		<div class="top-movie-img">
                                	<img src="${img}" alt="top-movies" />
                                </div>
                           		<div class="thumb-hover">
                              		<a class="play-video" href="<c:out value='${yearMovie.trailer}'/>"><i class="fa fa-play"></i></a>  
                           		</div>
                        	</div>
                        	<div class="top-movie-details">
                           		<h4><a href="/main/get?mno=<c:out value='${yearMovie.mno}'/>"><c:out value='${yearMovie.title}'/></a></h4>
                           		<div class="movie-details-thumbs">
                              		<ul>
                                 		<li>
                                    		<i class="fa fa-eye"></i><c:out value='${yearMovie.view_cnt}'/>
                                 		</li>
                                 		<li></li>
                                 		<li>
                                    		<span class="rating"><i class="fa fa-star"></i><c:out value='${yearMovie.avg_score}'/></span>
                                 		</li>
                              		</ul>
                           		</div>
                        	</div>
                    	</div> 
                	</c:forEach>                                                            
            	</div>
        	</div>
    	</div>
	</div>
</section>
<!-- 2019-2020년 중에 평점 높은 영화 Best5 End -->
                     
<!-- 평점 높은 영화 -->
<section class="filmoja-theater-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-md-5">
            	<div class="theater-left">
                	<div class="theater-box">
                    	<div class="theater-text">
                        	<h1>${randomMovie.title}</h1>
                        	<h4>
								${randomMovie.genre1}
                            	<c:if test='${randomMovie.genre2 != null}'>
                              		, ${randomMovie.genre2}
                              	</c:if>
                              	<c:if test='${randomMovie.genre3 != null}'>
                              		, ${randomMovie.genre3}
                              	</c:if>	
  						   	</h4>
  						   	<p>
								${randomMovie.actor1}
                              	<c:if test='${randomMovie.actor2 != null}'>
                              		, ${randomMovie.actor2}
                              	</c:if>
                              	<c:if test='${randomMovie.actor3 != null}'>
                              		, ${randomMovie.actor3}
                              	</c:if>
                              	<c:if test='${randomMovie.actor4 != null}'>
                              		, ${randomMovie.actor4}
                              	</c:if>
							</p>
							<p>${randomMovie.age} 관람</p>
                           	<a href="/main/get?mno=<c:out value='${randomMovie.mno}'/>" class="filmoja-btn2">자세히 보기</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!--평점 높은 영화 썸네일 이미지 경로  -->
               <div class="col-md-7">
               		<div class="theater-slider slider-for">
                  		<div class="single-theater">
                    		<img src="${randomMovie.thumbnail_path}" alt="theater thumb" />
                        	<a class="play-video" href="${randomMovie.trailer}">
                        		<i class="fa fa-play"></i>
                        	</a>
                		</div>
            		</div>
        		</div>
        		<!--평점 높은 영화 썸네일 이미지 경로  End -->
    		</div>
		</div>
</section>
<!-- 평점 높은 영화 End -->
<!--  한국 영화 Best 5 -->      
<section class="filmoja-top-movies-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="filmoja-heading">
                	<h2>top movies :<span> 한국 영화</span></h2>
                </div>
            </div>
         </div>
         <div class="row">
         	<div class="col-md-12">
            	<div class="top-movie-slider owl-carousel">                    
                	<c:forEach items="${korMovie}" var="korMovie">
                    	<c:url value="/main/img" var="img">
            				<c:param name="img_path" value="${korMovie.imageVO.img_path}"/>
            				<c:param name="img_name" value="${korMovie.imageVO.img_name}"/>            		
            			</c:url>
                     	<div class="single-top-movie">
                        	<div class="top-movie-wrap">
                           		<div class="top-movie-img">
                               		<img src="${img}" alt="top-movies" />
                           		</div>
                           		<div class="thumb-hover">
                              		<a class="play-video" href="<c:out value='${korMovie.trailer}'/>"><i class="fa fa-play"></i></a>
                              		<div class="thumb-date">
                                		<span>05:30</span>
                              		</div>
                           		</div>
                        	</div>
                        	<div class="top-movie-details">
                           		<h4><a href="/main/get?mno=<c:out value='${korMovie.mno}'/>"><c:out value='${korMovie.title}'/></a></h4>
                           		<div class="movie-details-thumbs">
                              		<ul>
                                 		<li>
                                    		<i class="fa fa-eye"></i><c:out value='${korMovie.view_cnt}'/>
                                 		</li>
                                 		<li></li>
                                 		<li>
                                    		<span class="rating"><i class="fa fa-star"></i><c:out value='${korMovie.avg_score}'/></span>
                                 		</li>
                              		</ul>
                           		</div>
                        	</div>
                     	</div> 
                	</c:forEach>                                                            
            	</div>
        	</div>
    	</div>
	</div>
</section>
<!--  한국 영화 Best 5 End -->  
<!--  외국 영화 Best 5 -->     
<section class="filmoja-top-movies-area section_70">
	<div class="container">
    	 <div class="row">
         	<div class="col-md-12">
            	<div class="filmoja-heading">
                	<h2>top movies :<span> 외국 영화</span></h2>
                </div>
            </div>
          </div>
          <div class="row">
          	<div class="col-md-12">
            	<div class="top-movie-slider owl-carousel">                    
                	<c:forEach items="${foreignMovie}" var="foreignMovie">
                    	<c:url value="/main/img" var="img">
            				<c:param name="img_path" value="${foreignMovie.imageVO.img_path}"/>
            				<c:param name="img_name" value="${foreignMovie.imageVO.img_name}"/>            		
            			</c:url>
                     	<div class="single-top-movie">
                        	<div class="top-movie-wrap">
                           		<div class="top-movie-img">
                               		<img src="${img}" alt="top-movies" />
                           		</div>
                           		<div class="thumb-hover">
                              		<a class="play-video" href="<c:out value='${foreignMovie.trailer}'/>"><i class="fa fa-play"></i></a>
                              		<div class="thumb-date">
                                 		<span>05:30</span>
                              		</div>
                           		</div>
                        	</div>
                        	<div class="top-movie-details">
                           		<h4><a href="/main/get?mno=<c:out value='${foreignMovie.mno}'/>"><c:out value='${foreignMovie.title}'/></a></h4>
                           		<div class="movie-details-thumbs">
                              		<ul>   
                                 		<li>
                                    		<i class="fa fa-eye"></i><c:out value='${foreignMovie.view_cnt}'/>
                                 		</li>
                                 		<li></li>
                                 		<li>
                                    		<span class="rating"><i class="fa fa-star"></i><c:out value='${foreignMovie.avg_score}'/></span>
                                 		</li>
                              		</ul>
                           		</div>
                        	</div>
                     	</div> 
                	</c:forEach>                                                            
            	</div>
        	</div>
    	</div>
	</div>
</section>                           
<!--  외국 영화 Best 5 End -->       

      
 <script type="text/javascript">
      var csrfHeaderName = "${_csrf.headerName}";
	  var csrfTokenValue = "${_csrf.token}";
	  
      //뒤로 가기 문제 해결 // 한 번만 결과 출력
      	$(document).ready(function(){
      		var result = '<c:out value= "${result}"/>';
      		checkReuslt(result);
      		history.replaceState({},null,null);
      		
      		function checkReuslt(result){
      			if (result === '' || history.state) {
      				return;
      			} else{
      			alert("정상적으로 처리되었습니다.");
      			}
      		}
      	
		});
      	    
</script> 

      
<%@include file="../includes/footer.jsp" %>
