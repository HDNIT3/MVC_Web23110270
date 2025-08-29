<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng Nhập Vào Hệ Thống</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<c:if test="${alert != null}">
		<h3 class="alert alert-danger">${alert}</h3>
	</c:if>

	<form action="login" method="post">
		<section>
			<label class="input login-input">
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="fa fa-user"></i></span> <input
						type="text" class="form-control" placeholder="username"
						name="username">
				</div>
			</label>
		</section>

		<section>
			<label class="input login-input">
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
						type="password" class="form-control" placeholder="password"
						name="password">
				</div>
			</label>
		</section>

		<div class="form-check mb-3">
			<input type="checkbox" class="form-check-input" name="remember"
				value="1"> <label class="form-check-label" for="remember">Remember
				me</label>
		</div>

		<button type="submit" class="btn btn-primary">Đăng nhập</button>
	</form>

	<p>Nếu bạn chưa có tài khoản trên hệ thống, hãy đăng ký</p>
	<p class="text-center mt-3">
		    <form action="/bai1/register" method="get" style="display:inline;">
		        <button type="submit" class="btn btn-link p-0 m-0">Đăng kí</button>
		    </form>
	</p>
</body>
</html>