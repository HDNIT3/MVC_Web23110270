<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Tạo tài khoản mới</h2>
		<c:if test="${alert != null}">
			<h3 class="alert alert-danger">${alert}</h3>
		</c:if>

        <form action="register" method="post">
            <section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" placeholder="Tài khoản" name="username" class="form-control">
                    </div>
                </label>
            </section>
			<section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="text" placeholder="Nhập hoten" name="fullname" class="form-control">
                    </div>
                </label>
            </section>
            <section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="email" placeholder="Nhập Email" name="email" class="form-control">
                    </div>
                </label>
            </section>
			<section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="phone" placeholder="Nhập phone" name="phone" class="form-control">
                    </div>
                </label>
            </section>
            <section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" placeholder="Mật khẩu" name="password" class="form-control">
                    </div>
                </label>
            </section>

            <section>
                <label class="input login-input">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" placeholder="Nhập lại mật khẩu" name="confirm_password" class="form-control">
                    </div>
                </label>
            </section>
			<div class="form-check mb-3">
				<input type="checkbox" class="form-check-input" name="remember"
					value="1"> <label class="form-check-label" for="remember">Remember me</label>
			</div>

			<button type="submit" class="btn btn-primary btn-block">Tạo tài khoản</button>
        </form>

        <p class="text-center mt-3">Nếu bạn đã có tài khoản? 
		    <form action="/bai1/login" method="get" style="display:inline;">
		        <button type="submit" class="btn btn-link p-0 m-0">Đăng nhập</button>
		    </form>
		</p>
    </div>

</body>
</html>