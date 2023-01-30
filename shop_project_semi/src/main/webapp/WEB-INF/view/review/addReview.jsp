<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ADD REVIEW | TYPESERVICE</title>
		<link rel="icon" type="image/png" href="#" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<style>
			.star {
				position: relative;
				font-size: 2rem;
				color: #ddd;
			}
			
			.star input {
				width: 100%;
				height: 100%;
				position: absolute;
				left: 0;
				opacity: 0;
				cursor: pointer;
			}
			
			.star span {
				width: 0;
				position: absolute;
				left: 0;
				color: #FF923A;
				overflow: hidden;
				pointer-events: none;
			}
		</style>
	</head>
	<body>
		<h4 class="text-center mt-3 fw-bold">리뷰쓰기</h4>
		<hr/>
		<div class="container text-center">
			<div class="p-2 mb-3" style="background-color: #5c6686; color: white;">리뷰 작성 시 포인트 <span style="color: #fff68a;">${m.point}원</span> 적립</div>
			<div class="d-flex">
				<div>
					<img src="${pageContext.request.contextPath}/upload/${m.filename}" alt="상품 이미지" width="100px" height="100px"/>
				</div>
				<div>
					<div class="text-muted ms-2">[TYPESERVICE]</div>
					<div>${m.goodsName}</div>
				</div>
			</div>
			<div>
				<form id="addReview" action="${pageContext.request.contextPath}/member/review/add" method="post">
					<input type="hidden" name="point" value="${m.point}"/>
					<input type="hidden" name="orderCode" value="${m.orderCode}">
					<input type="hidden" name="goodsCode" value="${m.goodsCode}">
					
					<div>
						<span class="fw-bold">상품을 사용해보셨나요?</span>
						<div>
							<!-- <input type="number" name="star"> -->
							<span class="star">
								☆☆☆☆☆
								<span>★★★★★</span>
								<input type="range" name="star" id="starRange" oninput="drawStar(this)" value="1" step="2" min="0" max="10">
							</span>
							
							
						</div>
					</div>
					<hr/>
					<div>
						<div class="text-center fw-bold mt-3 mb-2">어떤 점이 좋았나요?</div>
						<textarea class="w-100 p-3" rows="5" cols="30" id="reviewMemo" name="reviewMemo" placeholder="상품 후기를 남겨주세요. (공백 제외 10자 이상)" style="resize: none; background-color: #f4f4f4"></textarea>
					</div>
					<hr/>
					<div class="row p-3">
						<button class="btn border col p-2 me-1" type="button" onClick='window.close()'>취소</button>
						<button id="submitBtn" class="btn btn-light border col p-2" type="button">리뷰 등록</button>
					</div>
				</form>
			</div>
		</div>	
		<script>
			const starRange = document.querySelector('#starRange');
			const starSpan = document.querySelector('.star span');
			const reviewMemo = document.querySelector('#reviewMemo');
 
			
			const drawStar = (target) => {
				let star = starRange.value;
				starSpan.style.width = (star*10) + '%';
			}
			
			$('#submitBtn').click(function() {
				let reviewMemo_ = reviewMemo.value.replace(/(\s*)/g,'')
				if(starRange.value <= 2) {
					alert('상품 별점을 입력해주세요.')
					return;
				} else if(reviewMemo_.length < 10) {
					alert('10자 이상 입력해주세요.')
					return;
				}
				
				$('#addReview').submit();
			})
			
		</script>
	</body>
</html>