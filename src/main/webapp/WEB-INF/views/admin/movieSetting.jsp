<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/sidebar.jsp"%>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
    <div id="content">
    	<%@ include file="../includes/header.jsp"%>
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"></h1>
          <p class="mb-4"></p>      
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
          	<div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">영화 설정</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	<!-- Breadcrumb Area Start -->
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="breadcrumb-box">
								<h2>Movie List Sidebar</h2>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-light" id="addMovieBtn">
								새로운 영화 등록</button>
								<!-- Modal -->
								<div class="modal" id="addMovieModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Movie Register</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>	
											<!--  영화 세부 정보 등록 Form -->
											<form role="form" id="movieForm" action="/admin/uploadMovie" method="post" >						
												<div class="modal-body">

													<div class="form-group">
														<label>영화 제목</label> <input type="text" class="form-control" name="title" id='title' placeholder='title'>
													</div>
													<div class="form-group">
														<label>감독</label> <input type="text" class="form-control" id='director' name='director'>
													</div>
													<div class="form-group">
														<label>출연 배우</label> 
														<div class="row">
  															<div class="col-sm-3"><input type="text" class="form-control" name='actor1' id='actor1' ></div>
													
  															<div class="col-sm-3"><input type="text" class="form-control" name='actor2' id='actor2' ></div>
											
  															<div class="col-sm-3"><input type="text" class="form-control" name='actor3' id='actor3' ></div>
  												
  															<div class="col-sm-3"><input type="text" class="form-control" name='actor4' id='actor4' ></div>
														</div>
													</div>
													<div class="form-group">
														<label>줄거리</label>
														<textarea class="form-control" rows="5" id="plot" name="plot"></textarea>
													</div>
													<div class="form-group">
														<label>장르</label> 
														<div class="row">
  															<div class=" col-lg-12">
  																<input type="checkbox" name="movieGenre" id="Action" value="Action" />
                              									<label for="Action">액션  </label>
                              						
                              									<input type="checkbox" name="movieGenre" id="Comedy" value="Comedy" />
                              									<label for="Comedy"><span></span>코미디</label>
                              						
                              									<input type="checkbox"	name="movieGenre" id="SF" value="SF" />
                             									<label for="SF"><span></span>SF</label>
                             						
                             									<input type="checkbox"	name="movieGenre" id="Adventure" value="Adventure" />
                             									<label for="Adventure"><span></span>모험</label>
                             						
																<input  type="checkbox"	name="movieGenre" id="Drama" value="Drama" />
                              									<label for="Drama"><span></span>드라마</label>
                              						
                             									<input  type="checkbox"	name="movieGenre" id="historical" value="historical" />
                              									<label for="historical "><span></span>시대극</label>
                              						
                              									<input  type="checkbox"	name="movieGenre" id="Fantasy" value="Fantasy" />
                              									<label for="Fantasy"><span></span>판타지</label>
                              					 			</div>	
                            					 			<div class=" col-lg-12">
                             									<input  type="checkbox"	name="movieGenre" id="animation" value="animation" />
                             						 			<label for="animation"><span></span>애니메이션</label>
                           
                             						 			<input  type="checkbox"	name="movieGenre" id="thriller" value="thriller" />
                             									<label for="thriller"><span></span>스릴러</label>
                            
                             						 			<input  type="checkbox"	name="movieGenre" id="War" value="War" />
                             						 			<label for="War"><span></span>전쟁</label>
                          
                              						 			<input  type="checkbox"	name="movieGenre" id="Horror" value="Horror" />
                              						 			<label for="Horror"><span></span>공포</label>
                           
                              						 			<input  type="checkbox"	name="movieGenre" id="Mystery" value="Mystery" />
                             						 			<label for="Mystery"><span></span>미스터리</label>
                              						
                              						 			<input  type="checkbox"	name="movieGenre" id="Romance" value="Romance" />
                             						 			<label for="Romance"><span></span>멜로/로맨스</label>
                           						 			</div>			
														</div>
													</div>
													<div class="form-group">
														<div class="row">
												
  															<div class="col-sm-4"><label>출시일</label> <input type="text" class="form-control" name='release' id='release' placeholder="yy.mm.dd" ></div>
												
  															<div class="col-sm-4"><label>상영시간</label> <input type="text" class="form-control" name='time' id='time' placeholder="xx분" ></div>
  												
  															<div class="col-sm-4"><label>국내/해외</label>
  																<span> 
  																	<select name="nation" id="nation"> 
  																		<option value = ''>---국가 선택 ---</option>
  																		<option value = "korea">한국 영화</option>
  																		<option value = "foreign">외국 영화</option>
  																	</select>
  																</span>
  															</div>												 												  												
														</div>
													</div>
									
													<div class="form-group">
														<label>트레일러 주소</label> <input type="text" class="form-control" name="trailer" id= "trailer" >
													</div>
									
													<div class="form-group">
														<label>썸네일 이미지 주소</label> <input type="text" class="form-control" name="thumbnail_path" id= "thumbnail_path" >
													</div>
																											
													<div class="form-check-inline">
 														<label class="form-check-label">
    														<input type="radio" class="form-check-input" name="age" id="전체이용가" value="전체이용가">전체이용가
 										 				</label>
								  					</div>
								   					<div class="form-check-inline">
 										 				<label class="form-check-label">
    														<input type="radio" class="form-check-input" name="age" value="12세이상">12세이상
  										 				</label>
								  					</div>
							     					<div class="form-check-inline">
  														<label class="form-check-label">
    														<input type="radio" class="form-check-input" name="age"  value="15세이상">15세이상
 														</label>
								  					</div>
								  					<div class="form-check-inline">
  								  						<label class="form-check-label">
    														<input type="radio" class="form-check-input" name="age"  value="18세이상">18세이상
 														</label>
								  					</div>
								  					
								  					<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />
								  					
								  					<div class="modal-footer">
								  						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
														<button type="submit" id="uploadMovie" class="btn btn-primary">영화 등록</button>
														<button type="submit" id="modifyMovie" class="btn btn-warning">영화 수정</button>
														<button type="submit" id="removeMovie" class="btn btn-danger">영화 삭제</button>
								 					</div>		
												</div>
											</form>
											<!--  영화 세부 정보 등록 Form end -->
											<!--  타이틀 이미지 파일 첨부 -->							
											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-default">
														<div class="panel-heading">타이틀 이미지</div>
															<!--  /.panel-heading -->
															<div class="panel-body">
																<div class="form-group">
																	<div class="uploadDiv">
																		<input type="file" name="uploadImg" id="movieImage" accept="image/*">
																		<div class='uploadResult'> 
          																	<ul>
          
        												 					</ul>
        																 </div>	
       																</div>
																</div>
															</div>
												 	</div>
												</div>
											</div>
											<!--  타이틀 이미지 파일 첨부 end-->																										
										</div>
									</div>
								</div>
								<!--  Modal end -->
							</div>
						</div>
					</div>
				</div>
				<!-- Breadcrumb Area end -->


	  			<!-- Movie List Area Start -->
      			<section class="filmoja-movie-list-area tv-series-page section_70">
         		<div class="container">
            		<div class="row">
               			<div class="col-md-12">
                  			<div class="browse-option-box">
                     			<div class="total-item-show">
                        			<p>총 <c:out value="${movieCnt}"/>개의 영화가 등록되어 있습니다.</p>
                     			</div>
                     			<!-- 정렬 처리  -->
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
                     			<!-- 정렬 처리  end-->
                  			</div>
               			</div>
           			</div>
           		
           			<!--  영화 정보 처리 -->
           		 	<div class="row">
            			<c:forEach items="${movie}" var="movie" varStatus="status">	
            				<c:url value="/admin/img" var="img1">
            					<c:param name="img_path" value="${movie.imageVO.img_path}"/>
            					<c:param name="img_name" value="${movie.imageVO.img_name}"/>            		
            				</c:url>	
               				<div class="col-md-3">
                  				<div class="single-top-movie">
                     				<div class="top-movie-wrap">
                        				<div class="top-movie-img">                           
                           					<img src="${img1}" alt="top-movies" />
                        				</div>
                        				<div class="thumb-hover">
                           					<a class="play-video" href="<c:out value='${movie.trailer}'/>"><i class="fa fa-play"></i></a>
                        				</div>
                     				</div>
                     				<div class="top-movie-details">
                        				<h4><input  type="button" id="movieStatus${status.index}" value="${movie.title}"
                        					data-title="${movie.title}" data-mno="${movie.mno}" data-director="${movie.director}"
                        					data-trailer="${movie.trailer}" data-actor1="${movie.actor1}" data-actor2="${movie.actor2}"
                        					data-actor3="${movie.actor3}" data-actor4="${movie.actor4}" data-plot="${movie.plot}"
                        					data-genre1="${movie.genre1}" data-genre2="${movie.genre2}" data-genre3="${movie.genre3}"
                        					data-release="${movie.release}" data-time="${movie.time}" data-age="${movie.age}"
                        					data-img_name="${movie.imageVO.img_name}" data-img_path="${movie.imageVO.img_path}"
                        					data-thumbnail_path="${movie.thumbnail_path}" data-nation="${movie.nation}"
                        					style="background-color:transparent;  border:0px transparent solid">
                        				</h4>
                        					<div class="movie-details-thumbs">
                           						<ul>
                              						<li>
                                 						<a href="#"><i class="fa fa-eye"></i><c:out value='${movie.view_cnt}'/></a>
                              						</li>
                              						<li>
                              						</li>
                             						 <li>
                                						<a href="#"><span class="rating"><i class="fa fa-star"></i><c:out value='${movie.avg_score}'/></span></a>
                              						</li>
                           						</ul>
                        					</div>
                    			 	</div>
                  				</div>
               				</div>
               			</c:forEach>
            		</div>
            		<!--  영화 정보 처리 end -->
            		
            		<!--  paging -->
            		<div class="row">
               			<div class="col-md-12" >
                  			<div class="pagination-box-row responsive-pag margin-top"> 			
                     			<ul class="pagination">
                     			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">                     	                     
                        			<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "active":""}>
                        			<a href="${num}">${num}</a></li>
                      			</c:forEach>
                      			<c:if test="${pageMaker.next}">
                        			<li><a href="${pageMaker.endPage +1}"><i class="fa fa-angle-double-right"></i></a></li>
                        		</c:if>
                     			</ul>
                  			</div>
               			</div>
            		</div>
            		<!--  paging end -->
            		
            		<form id='actionForm' action="/admin/movieSetting" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value='${pageMaker.cri.type}'>
					</form>	
         		</div>       		
      			</section>
      		  <!-- Movie List Area End -->
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->


     <script>
     	// csrf 공격 방지 위한 변수
     	var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		//확장자 및 용량 제한하는 기능
		var regex = new RegExp("(.*?)\.(jpg|png|fif|jpeg)$");
		var maxSize = 5242880; //5MB
	    var cloneObj = $(".uploadDiv").clone();
		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)==false) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		// 미리 보기 이미지
		var uploadResult = $(".uploadResult ul");
		function showImage(uploadResultArr){
			var str = "";
			
			$(uploadResultArr).each(function(i,obj){
				console.log(obj.img_path);
				console.log(obj.img_name);
				//한글이나 공백을 브라우저에서 get 방식으로 사용할때는 문제가 생길수 있으므로 인코딩 메서드 이용
				var fileCallPath =  encodeURIComponent(obj.img_path+"/s_"+obj.img_name);
				console.log(fileCallPath);
				str += "<li data-path='"+obj.img_path+"'";
				str +=" data-filename='"+obj.img_name+"'>";	
				str += "<div><button type='button' id='delBtn' data-file=\'"+fileCallPath+"\' class='btn btn-default btn-lg'>"
			    str += "<span class='glyphicon glyphicon-remove-sign'></span></button></div>"
				str += "<img src='showImage?img_name=" +fileCallPath+"'> </li>";
      
			});
			uploadResult.html(str);
		}
		
		
			$(document).ready(function() {
				
				// 새로운 영화 등록 버튼 누를 시.
				$("#addMovieBtn").on("click", function(e) {
					$("#addMovieModal").modal("show");
					$("#uploadMovie").show();
					$("#modifyMovie").hide();
				    $("#removeMovie").hide();
				});

				// Close 버튼 누를 시.
				$("#close_modal").on("click", function(e) {
					
					$("#addMovieModal").modal("hide");
					
				});
				
				// 모달 창 숨어질때.
				$('.modal').on('hidden.bs.modal', function (e) {
				    $(this).find('form')[0].reset()
				    
				    $("#showImgLI").remove();
				 
				  // delBtn이 없을 때. 등록된 이미지는 폴더에서 삭제 (미리 보기 이미지 생성 시에 같이 생겨남)
				 if($("#delBtn").length != 0){
				    var targetFile = $("#delBtn").data("file");
					$.ajax({
						url: '/admin/deleteImage',
						data: {img_name: targetFile},
						dataType: 'text',
						type: 'post',
						//스프링 시큐리티 csrf 공격 방지 
						beforeSend: function(xhr){
	      					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	      				},
						success: function(result){
							alert(result);
							uploadResult.empty();
							$("#movieImage").empty();
							//파일초기화
							var agent = navigator.userAgent.toLowerCase();										
							if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
							    $("#movieImage").replaceWith($("#movieImage").clone(true));
							}else{
							    $("#movieImage").val("");
							}

						}
					});
				}
				});
				
				//영화 타이틀 이미지 첨부 기능
				$("#movieImage").change(function(e) {
					
					var formData = new FormData();
					var inputImg1 = $("input[name='uploadImg']");														
					var movieImg1 = inputImg1[0].files;
																													
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
					});
				});
				
				//영화 타이틀 미리보기 이미지 삭제 기능
				$(".uploadResult").on("click","button", function(e){
					console.log("삭제");
					
					var targetFile = $(this).data("file");
					
					$.ajax({
						url: '/admin/deleteImage',
						data: {img_name: targetFile},
						dataType: 'text',
						type: 'post',
						beforeSend: function(xhr){
	      					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	      				},
						success: function(result){
							alert(result);
							uploadResult.empty();
							$("#movieImage").show();
							$("#movieImage").empty();
							//파일초기화
							var agent = navigator.userAgent.toLowerCase();										
							if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
							    $("#movieImage").replaceWith($("#movieImage").clone(true));
							}else{
							    $("#movieImage").val("");
							}

						}
					})
				});
				 var formObj = $("form[role='form']");
				//영화 정보 등록
				$("#uploadMovie").on("click", function(e){
					 e.preventDefault();
					 
					 var str = "";
					 
					 $(".uploadResult ul li").each(function(i, obj){
					      
					      var jobj = $(obj);
					      
					      console.dir(jobj);
					      console.log("-------------------------");
					      console.log(jobj.data("filename"));
					         
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
							alert("장르를 알맞게 선택하세요(최소 1개, 최대3개).");
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
				//영화 수정
				$("#modifyMovie").on("click", function(e){
					var formObj = $("form[role='form']");
					e.preventDefault();
					$("#movieForm").attr("action", "/admin/modifyMovie");
					 var str = "";
					 var str2 = "";
					 
					 var genre = [];
					 var total_cnt = 0;
						$("input[name='movieGenre']:checked").each(function(){
							if(this.checked){
							genre[total_cnt] = this.value;
							total_cnt ++ ;
							}
						});
						switch (genre.length){				
						case 1 : 	str2 += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
						 			str2 += "<input type='hidden' name='genre2' value=''>";
								 	str2 += "<input type='hidden' name='genre3' value=''>";
								 	break;
						case 2 :	str2 += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
			 						str2 += "<input type='hidden' name='genre2' value='"+genre[1]+"'>";
					 				str2 += "<input type='hidden' name='genre3' value=''>";	
					 				break;
						case 3 : 	str2 += "<input type='hidden' name='genre1' value='"+genre[0]+"'>";
									str2 += "<input type='hidden' name='genre2' value='"+genre[1]+"'>";
		 							str2 += "<input type='hidden' name='genre3' value='"+genre[2]+"'>";
		 							break;
						}
					 
					// 이미지를 수정할 시 반응.
					 if($("#showImgLI").length == 0 ){
					 $(".uploadResult ul li").each(function(i, obj){
					      
					      var jobj = $(obj);
					      
					      console.dir(jobj);
					      console.log("-------------------------");
					      console.log(jobj.data("filename"));
					         
					      str += "<input type='hidden' name='titleImage.img_name' value='"+jobj.data("filename")+"'>";
					      str += "<input type='hidden' name='titleImage.img_path' value='"+jobj.data("path")+"'>";
					      
					    });
					 	if(genre.length == 0 || genre.length > 3 ){
							alert("장르를 알맞게 선택하세요(최소 1개, 최대3개).");
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
					    	formObj.append(str);
					    	formObj.append(str2).submit();								    	
					    }
					 // 이미지를 수정하지 않을 시 반응.	
					 } else{
						 if(genre.length == 0 || genre.length > 3 ){
								alert("장르를 알맞게 선택하세요(최소 1개, 최대3개).");
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
							 formObj.append(str2).submit();
						 }
					 }
					 								    		   								    
				});
				//영화 삭제
				$("#removeMovie").on("click", function(e){
					e.preventDefault();
					$("#movieForm").attr("action", "/admin/removeMovie");
					$("#movieForm").submit();
				});
				

				
				var actionForm = $("#actionForm");
				//페이징 처리
				$(".paginate_button a").on("click",function(e) {

							e.preventDefault();

							console.log('click');

							actionForm.find("input[name='pageNum']")
									.val($(this).attr("href"));
							actionForm.submit();
						});
				
				// 정렬 처리
				$("#sortMovie").change(function(e){
					var sortMovie = $("#sortMovie option:selected").val();
					
					console.log(sortMovie);
					
					actionForm.find("input[name='pageNum']").val("1");
					actionForm.find("input[name='type']").val(sortMovie);
					
					actionForm.submit();
					
				});
				
			});
     
	 // 영화 수정 시에 등록된 영화 정보 불러오기
     $("body").on("click", "[id^=movieStatus]", function(e){
        	str = "";
        	
     		var mnoValue = $("#"+this.id).data("mno");
     		console.log(mnoValue);
     		$("#title").val($("#"+this.id).data("title"));
     		$("#director").val($("#"+this.id).data("director"));
     		$("#actor1").val($("#"+this.id).data("actor1"));
     		$("#actor2").val($("#"+this.id).data("actor2"));
     		$("#actor3").val($("#"+this.id).data("actor3"));
     		$("#actor4").val($("#"+this.id).data("actor4"));
     		$("#plot").val($("#"+this.id).data("plot"));
     		$("#release").val($("#"+this.id).data("release"));
     		$("#time").val($("#"+this.id).data("time"));
     		$("#trailer").val($("#"+this.id).data("trailer"));
     		$("#thumbnail_path").val($("#"+this.id).data("thumbnail_path"));
     		
     		var age = $("#"+this.id).data("age");
     		var genre1 = $("#"+this.id).data("genre1");
     		var genre2 = $("#"+this.id).data("genre2");
     		var genre3 = $("#"+this.id).data("genre3");
     		var nation = $("#"+this.id).data("nation");
     		
			$("#addMovieModal").modal("show");
			$("#modifyMovie").show();
		    $("#removeMovie").show();
			$("#uploadMovie").hide();
			$("#movieImage").hide();
			
			$("input:radio[name ='age']:input[value='"+age+"']").attr("checked", true);
	
			$('input:checkbox[id='+genre1+']').prop("checked", true); 
			if(genre2 != ""){
			$('input:checkbox[id='+genre2+']').prop("checked", true); 
			}
			if(genre3 != ""){
			$('input:checkbox[id='+genre3+']').prop("checked", true); 
			}
			$("#nation option[value='"+nation+"']").prop("selected","selected");
			
			var imgPath = $('#'+this.id).data('img_path');
			var imgName = $('#'+this.id).data('img_name');
			var fileCallPath =  encodeURIComponent(imgPath+"/s_"+imgName);
			
			if($('#mno').length){
				$("#mno").val(mnoValue);
			} else{
				$(".modal-body").append("<input type='hidden' name='mno' id='mno' value='"+mnoValue+"' />");
			}
			
			// 미리보기 설정 창
			str += "<li id='showImgLI' data-path='"+imgPath+"'";
			str +=" data-filename='"+imgName+"'>";	
			str += "<div><button type='button' data-file=\'"+fileCallPath+"\' class='btn btn-default btn-lg'>"
		    str += "<span class='glyphicon glyphicon-remove-sign'></span></button></div>"
			str += "<img src='showImage?img_name=" +fileCallPath+"'> </li>"
		    $(".uploadResult ul").html(str);
			 
     	});
    
     	
    	
     </script>  
       
      
<%@include file="../includes/footer.jsp"%>

