<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-edit me-2"></i>Chỉnh sửa thông tin sinh viên</h3>
                </div>
                <div class="card-body">
                    <form:form method="POST" modelAttribute="sinhvien">
                        <div class="mb-3">
                            <label for="maSV" class="form-label">Mã sinh viên</label>
                            <form:input path="maSV" id="maSV" cssClass="form-control" readonly="true"/>
                            <form:errors path="maSV" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="hoTen" class="form-label">Họ tên <span class="text-danger">*</span></label>
                            <form:input path="hoTen" id="hoTen" cssClass="form-control"/>
                            <form:errors path="hoTen" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="ngaySinh" class="form-label">Ngày sinh <span class="text-danger">*</span></label>
                            <fmt:formatDate value="${sinhvien.ngaySinh}" pattern="yyyy-MM-dd" var="formattedDate" />
                            <form:input path="ngaySinh" type="date" id="ngaySinh" cssClass="form-control" value="${formattedDate}"/>
                            <form:errors path="ngaySinh" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="diaChi" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
                            <form:input path="diaChi" id="diaChi" cssClass="form-control"/>
                            <form:errors path="diaChi" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="soDT" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                            <form:input path="soDT" id="soDT" cssClass="form-control"/>
                            <form:errors path="soDT" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="truong" class="form-label">Trường <span class="text-danger">*</span></label>
                            <form:select path="truong.maTruong" id="truong" cssClass="form-control">
                                <form:option value="">-- Chọn trường --</form:option>
                                <form:options items="${truong}" itemValue="maTruong" itemLabel="tenTruong"/>
                            </form:select>
                            <form:errors path="truong" cssClass="text-danger"/>
                        </div>

                        <div class="d-flex justify-content-end gap-2">
                            <a href="${pageContext.request.contextPath}/sinhvien" 
                               class="btn btn-secondary">
                                <i class="fas fa-times me-1"></i>Hủy
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i>Lưu thay đổi
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div> 