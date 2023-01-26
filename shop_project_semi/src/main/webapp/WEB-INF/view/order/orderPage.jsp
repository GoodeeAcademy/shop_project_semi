<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
        <meta name="title" content="SIGN IN"/>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="icon" type="image/png" href="images/icons/favicon.png" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/iconic/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/linearicons-v1.0.0/icon-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/main.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/style.css">
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<title>ORDER｜TYPESERVICE</title>
		
		<style>
			.login-button__item{display:block;box-sizing:border-box;width:120px;height:100px;padding:15px 5px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
			.content-one {max-width: 1000px; margin: auto; box-sizing:border-box; margin:0 auto;padding-bottom:100px;line-height:21px;}
			.orderInfo{width: 100%; margin: auto;}
			.infoButton{line-height: 65px; font-size: 15px; margin: 5px;}
			.buttonBox{width:100%; margin-top: 5%; text-align: center; vertical-align: middle;}
			th, td{text-align: center;}
			.signin-input__input{box-sizing:content-box;width:100px;;height:50px;margin-top:8px;padding:0 12px;border-bottom:1px solid #000;background-color:#fff;font-size:15px;color:#000;text-align:center;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none}
			.signin{box-sizing:content-box;height:50px;margin-top:18px;padding:0 5px;background-color:#fff;font-size:30px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none; vertical-align: middle;}
			.login-button__item{display:block;box-sizing:border-box;width:100%;height:50px;padding:14px 16px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
		</style>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		
		<!-- content start -->
		<div style="margin: 20px 0 30px; padding: 0 0 15px; border-bottom: 1px solid #000">
			<h2 style="color: #000;">ORDER</h2>
		</div>
		
		<div class="content-one">
			<div class="orderInfo" style="margin-top: 40px;">
				<table class="table table-bordered">
					<tr>
						<th colspan="2">상품명</th>
						<th>수량</th>
						<th>금액</th>
					</tr>
					<c:set var="totalPrice" value="0"></c:set>
					<c:forEach var="c" items="${cart}">
						<tr>
							<td class="align-middle col-sm-2"><img src="${pageContext.request.contextPath}/upload/${c['filename']}" width="50px" height="50px" alt="이미지"></td>
							<td class="align-middle col-sm-6">${c['goodsName']}</td>
							<td class="align-middle col-sm-2">${c['quantity']}개</td>
							<td class="align-middle col-sm-2">${c['goodsPrice'] * c['quantity']}원</td>
						</tr>
						<c:set var="totalPrice" value="${totalPrice+(c['goodsPrice']*c['quantity'])}"></c:set>
					</c:forEach>
					<tr>
						<th colspan="3">총 금액</th>
						<td><c:out value="${totalPrice}원"></c:out></td>
					</tr>
				</table>
			</div>
			<div class="orderInfo">
				<h3 style="color: #000; margin-top: 40px; margin-bottom: 20px;">CUSTOMER</h3>
				<form method="post" id="orderPage" action="${pageContext.request.contextPath}/OrderController">
					<table class="table">
						<tr>
							<th class="col-sm-3">주문자</th>
							<td class="col-sm-9"><input type="text" id="orderName" name="orderName" value="${loginCustomer.customerName}"></td>
						</tr> 
						<tr>
							<th class="col-sm-3 align-middle">전화번호</th>
							<td class="col-sm-9 align-middle">
								<div class="d-flex flex-row">
									<select id="phone1" name="phone1" class="signin-input__input" style="text-align: center;">
										<option value="">==선택==</option>
										<option value="02">02</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="012">031</option>
										<option value="013">032</option>
										<option value="0507">0507</option>
									</select>
									<span class="signin">-</span>
									<input type="text" id="phone2" name="phone2" class="signin-input__input"
										maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1'));"
										value="${splitPhone[1]}">
									<span class="signin">-</span>
									<input type="text" id="phone3" name="phone3" class="signin-input__input"
										maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1'));"
									 	value="${splitPhone[2]}">
								</div>
							</td>
						</tr>
						<tr>
							<th class="col-sm-3 align-middle">주소</th>
							<td class="col-sm-9 align-middle">
								<%--<input type="text" id="address" name="address" value="${address}">--%>
								<div class="d-flex flex-row">
									<input type="text" name="addAddress1" id="postcode" placeholder="우편번호" class="signin-input__input" style="width:55%; text-align: initial;" value="${add[0]}" readonly="readonly">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="login-button__item ml-4" style="width:20%; background-color: #fff"><br>
								</div>
								<input type="text" name="addAddress2" id="address" placeholder="주소" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[1]}" readonly="readonly"><br>
								<input type="text" name="addAddress3" id="detailAddress" placeholder="상세주소" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[2]}">
								<input type="text" name="addAddress4" id="extraAddress" placeholder="참고항목" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[3]}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th class="col-sm-3 align-middle">포인트 할인</th>
							<td class="col-sm-9 align-middle">
								<div class="d-flex flex-row">
									<input type="text" name="point" id="point" value="${loginCustomer.point}" class="signin-input__input"
										oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');">
									<span style="margin-top:auto;">원 할인</span>
									<span style="color:red; margin-left: 40px; margin-top:auto;">${loginCustomer.point}원 사용 가능</span>
								</div>
							</td>
						</tr>
					</table>
					<button type="button" id="submitBtn" class="login-button__item">주문하기</button>
				</form>
			</div>
		</div>
		<!-- content end -->
		<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.js"></script>
		
		<script>
			$(document).ready(function() {
				
				$('#phone1').val('${splitPhone[0]}').prop("selected",true);
				
				let allCheck = false;
				
				$('#submitBtn').click(function() {
					if($('#orderName').val().length < 1) {
						alert('주문자 성함을 입력해주세요.');
						$('#orderName').focus()
					} else if($('#address').val().length < 1 ) {
						// 주소지 입력 수정하기 kakao api 기반값을 비교
						alert('주소를 입력해주세요.');
						$('#address').focus();
					} else if($('#phone1 option:selected').val().length < 1) {
						alert('지역번호를 선택해주세요.');
					} else if($('#phone2').val().length < 3 || $('#phone3').val().length < 4) {
						$('#phone2').focus();
						alert('올바른 전화번호를 입력하여 주세요.');
					} else if($('#addAddress1').val().length < 1  || $('#addAddress2').val.length < 1) {
						alert('주소를 입력해주세요.');
					} else if($('#point').val().length < 1) {
						alert('사용할 포인트를 입력해주세요.');
						$('#point').val('0');
						$('#point').focus();
					} else if($('#point').val() > ${loginCustomer.point}) {
						alert('보유중인 포인트보다 많습니다.');
						$('#point').val('${loginCustomer.point}');
						$('#point').focus();
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#orderPage').submit();
					}
				})
			})
		</script>
		<script>
			// 상품 상세 정보 select 
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<!-- 화면 레이아웃 -->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function() {
				$(this).css('position', 'relative');
				$(this).css('overflow', 'hidden');
				var ps = new PerfectScrollbar(this, {
					wheelSpeed : 1,
					scrollingThreshold : 1000,
					wheelPropagation : false,
				});
	
				$(window).on('resize', function() {
					ps.update();
				})
			});
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
				<!-- Daum Address Api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById('extraAddress').value = extraAddr;
		                
		                } else {
		                    document.getElementById('extraAddress').value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById('address').value = addr;
		                // 기존 DB에 저장된 주소지를 사용하지않고 새롭게 우편 검색시 다른 값을 선택시 상세주소항목을 지운다.
		                document.getElementById('detailAddress').value = '';
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('detailAddress').focus();
		            }
		        }).open();
		    }
		</script>
		
	</body>
</html>