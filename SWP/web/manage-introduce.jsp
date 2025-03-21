<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <title>Preclinic - Medical & Hospital - Bootstrap 4 Admin Template</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/tagsinput.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
        <!-- Custom CSS -->
        <style>
            .main-wrapper {
                display: flex;
            }

            .container {
                margin-left: 250px; /* Điều chỉnh theo kích thước sidebar */
                margin-top: 80px; /* Điều chỉnh theo kích thước header */
                padding: 20px;
            }

            /* Điều chỉnh sidebar nếu nó đang che nội dung */
            .sidebar {
                width: 250px; /* Hoặc kích thước sidebar của bạn */
                position: fixed;
                height: 100vh;
                top: 0;
                left: 0;
                background: #343a40; /* Màu nền */
                color: white;
                padding: 20px;
            }

            /* Điều chỉnh header nếu đang che nội dung */
            .header {
                position: fixed;
                width: 100%;
                top: 0;
                left: 0;
                height: 70px; /* Hoặc chiều cao header */
                background: #007bff; /* Màu nền */
                color: white;
                z-index: 1000; /* Đảm bảo header hiển thị trên cùng */
                padding: 10px;
                text-align: center;
            }


        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <jsp:include page="headerStaff.jsp"></jsp:include>
            <jsp:include page="sidebar.jsp"></jsp:include>



                <div class="container">
                    <!-- Form để thêm/sửa introduce -->
                    <div class="form-container">
                        <h3>${editMode ? 'Sửa Introduce' : 'Thêm Introduce'}</h3>
                    <form action="updateIntroduce" method="post">
                        <div class="form-group">
                            <label for="packageID">Chọn Gói Dịch Vụ:</label>
                            <select name="packageID" id="packageID" class="form-control" required>
                                <c:forEach var="service" items="${serviceList}">
                                    <option value="${service.packageID}" ${service.packageID == selectedService.packageID ? 'selected' : ''}>
                                        ${service.packageName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="introduce">Introduce:</label>
                            <textarea name="introduce" id="introduce" class="form-control" rows="4">${selectedService.introduce}</textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-custom">Lưu</button>
                        <a href="manageIntroduce" class="btn btn-secondary btn-custom">Hủy</a>
                    </form>
                </div>

                <!-- Danh sách dịch vụ -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Gói</th>
                            <th>Introduce</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="service" items="${serviceList}">
                            <tr>
                                <td>${service.packageID}</td>
                                <td>${service.packageName}</td>
                                <td>${service.introduce}</td>
                                <td>
                                    <a href="manageIntroduce?edit=true&packageID=${service.packageID}" class="btn btn-success btn-custom">Sửa</a>
                                    <a href="deleteIntroduce?packageID=${service.packageID}" class="btn btn-danger btn-custom" 
                                       onclick="return confirm('Bạn có chắc muốn xóa introduce của dịch vụ này không?')">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>



        <script>

            document.addEventListener("DOMContentLoaded", function () {
                ClassicEditor
                        .create(document.querySelector('#introduce'), {
                            ckfinder: {
                                uploadUrl: '/SWP/uploadckedittor' // Trỏ đến servlet xử lý upload
                            }
                        })
                        .catch(error => console.error(error));
            });

        </script>



        <!-- Scripts -->
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/tagsinput.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>