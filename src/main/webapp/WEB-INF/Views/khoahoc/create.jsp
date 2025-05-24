<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-plus-circle me-2"></i>Thêm khóa học mới</h3>
                </div>
                <div class="card-body">
                    <form:form action="${pageContext.request.contextPath}/khoahoc" method="POST" modelAttribute="khoahoc">
                        <div class="mb-3">
                            <label for="maKH" class="form-label">Mã khóa học <span class="text-danger">*</span></label>
                            <form:input path="maKH" id="maKH" cssClass="form-control"/>
                            <form:errors path="maKH" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="tenKH" class="form-label">Tên khóa học <span class="text-danger">*</span></label>
                            <form:input path="tenKH" id="tenKH" cssClass="form-control"/>
                            <form:errors path="tenKH" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="giangVien" class="form-label">Giảng viên <span class="text-danger">*</span></label>
                            <form:select path="giangVien.maGV" id="giangVien" cssClass="form-control">
                                <form:option value="">-- Chọn giảng viên --</form:option>
                                <form:options items="${giangviens}" itemValue="maGV" itemLabel="hoTen"/>
                            </form:select>
                            <form:errors path="giangVien" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="thoiGian" class="form-label">Thời gian <span class="text-danger">*</span></label>
                            <form:input path="thoiGian" type="datetime-local" id="thoiGian" cssClass="form-control"/>
                            <form:errors path="thoiGian" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="truong" class="form-label">Trường <span class="text-danger">*</span></label>
                            <form:select path="truong.maTruong" id="truong" cssClass="form-control">
                                <form:option value="">-- Chọn trường --</form:option>
                                <form:options items="${truongs}" itemValue="maTruong" itemLabel="tenTruong"/>
                            </form:select>
                            <form:errors path="truong" cssClass="text-danger"/>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Lưu
                            </button>
                            <a href="${pageContext.request.contextPath}/khoahoc" class="btn btn-secondary">
                                <i class="fas fa-times me-2"></i>Hủy
                            </a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div> 