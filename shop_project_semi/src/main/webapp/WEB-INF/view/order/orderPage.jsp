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
		
		<!-- ?????? ?????? -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<title>ORDER???TYPESERVICE</title>
		
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
						<th colspan="2">?????????</th>
						<th>??????</th>
						<th>??????</th>
					</tr>
					<c:set var="totalPrice" value="0"></c:set>
					<c:forEach var="c" items="${cart}">
						<tr>
							<td class="align-middle col-sm-2"><img src="${pageContext.request.contextPath}/upload/${c['filename']}" width="50px" height="50px" alt="?????????"></td>
							<td class="align-middle col-sm-6">${c['goodsName']}</td>
							<td class="align-middle col-sm-2">${c['quantity']}???</td>
							<td class="align-middle col-sm-2">${c['goodsPrice'] * c['quantity']}???</td>
						</tr>
						<c:set var="totalPrice" value="${totalPrice+(c['goodsPrice']*c['quantity'])}"></c:set>
					</c:forEach>
					<tr>
						<th colspan="3">??? ??????</th>
						<td><c:out value="${totalPrice}???"></c:out></td>
					</tr>
				</table>
			</div>
			<div class="orderInfo">
				<h3 style="color: #000; margin-top: 40px; margin-bottom: 20px;">CUSTOMER</h3>
				<form method="post" id="orderPage" action="${pageContext.request.contextPath}/member/order">
					<table class="table">
						<tr>
							<th class="col-sm-3">?????????</th>
							<td class="col-sm-9"><input type="text" id="orderName" name="orderName" value="${loginCustomer.customerName}"></td>
						</tr> 
						<tr>
							<th class="col-sm-3 align-middle">????????????</th>
							<td class="col-sm-9 align-middle">
								<div class="d-flex flex-row">
									<select id="phone1" name="phone1" class="signin-input__input" style="text-align: center;">
										<option value="">==??????==</option>
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
							<th class="col-sm-3 align-middle">??????</th>
							<td class="col-sm-9 align-middle">
								<%--<input type="text" id="address" name="address" value="${address}">--%>
								<div class="d-flex flex-row">
									<input type="text" name="addAddress1" id="postcode" placeholder="????????????" class="signin-input__input" style="width:55%; text-align: initial;" value="${add[0]}" readonly="readonly">
									<input type="button" onclick="execDaumPostcode()" value="???????????? ??????" class="login-button__item ml-4" style="width:20%; background-color: #fff"><br>
								</div>
								<input type="text" name="addAddress2" id="address" placeholder="??????" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[1]}" readonly="readonly"><br>
								<input type="text" name="addAddress3" id="detailAddress" placeholder="????????????" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[2]}">
								<input type="text" name="addAddress4" id="extraAddress" placeholder="????????????" class="signin-input__input" style="width:80%; text-align:initial;" value="${add[3]}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th class="col-sm-3 align-middle">????????? ??????</th>
							<td class="col-sm-9 align-middle">
								<div class="d-flex flex-row">
									<input type="text" name="point" id="point" value="${loginCustomer.point}" class="signin-input__input"
										oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');">
									<span style="margin-top:auto;">??? ??????</span>
									<span style="color:red; margin-left: 40px; margin-top:auto;">${loginCustomer.point}??? ?????? ??????</span>
								</div>
							</td>
						</tr>
					</table>
					<button type="button" id="submitBtn" class="login-button__item">????????????</button>
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
						alert('????????? ????????? ??????????????????.');
						$('#orderName').focus()
					} else if($('#address').val().length < 1 ) {
						// ????????? ?????? ???????????? kakao api ???????????? ??????
						alert('????????? ??????????????????.');
						$('#address').focus();
					} else if($('#phone1 option:selected').val().length < 1) {
						alert('??????????????? ??????????????????.');
					} else if($('#phone2').val().length < 3 || $('#phone3').val().length < 4) {
						$('#phone2').focus();
						alert('????????? ??????????????? ???????????? ?????????.');
					} else if($('#postcode').val().length < 1  || $('#address').val.length < 1) {
						alert('????????? ??????????????????.');
					} else if($('#point').val().length < 1) {
						alert('????????? ???????????? ??????????????????.');
						$('#point').val('0');
						$('#point').focus();
					} else if($('#point').val() > ${loginCustomer.point}) {
						alert('???????????? ??????????????? ????????????.');
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
			// ?????? ?????? ?????? select 
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<!-- ?????? ???????????? -->
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
		                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
		
		                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
		                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
		                var addr = ''; // ?????? ??????
		                var extraAddr = ''; // ???????????? ??????
		
		                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
		                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
		                    addr = data.roadAddress;
		                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
		                    addr = data.jibunAddress;
		                }
		
		                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
		                if(data.userSelectedType === 'R'){
		                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
		                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
		                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // ???????????? ??????, ??????????????? ?????? ????????????.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // ????????? ??????????????? ?????? ????????? ?????????.
		                    document.getElementById('extraAddress').value = extraAddr;
		                
		                } else {
		                    document.getElementById('extraAddress').value = '';
		                }
		
		                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById('address').value = addr;
		                // ?????? DB??? ????????? ???????????? ?????????????????? ????????? ?????? ????????? ?????? ?????? ????????? ????????????????????? ?????????.
		                document.getElementById('detailAddress').value = '';
		                // ????????? ???????????? ????????? ????????????.
		                document.getElementById('detailAddress').focus();
		            }
		        }).open();
		    }
		</script>
		
	</body>
</html>