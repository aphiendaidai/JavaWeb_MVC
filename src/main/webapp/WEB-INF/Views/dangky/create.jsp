<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-plus-circle me-2"></i>Thêm đăng ký mới</h3>
                </div>
                <div class="card-body">
                    <form:form action="${pageContext.request.contextPath}/dangky" method="POST" modelAttribute="dangky">
                        <div class="mb-3">
                            <label for="maDK" class="form-label">Mã đăng ký <span class="text-danger">*</span></label>
                            <form:input path="maDK" id="maDK" cssClass="form-control"/>
                            <form:errors path="maDK" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="sinhVien" class="form-label">Sinh viên <span class="text-danger">*</span></label>
                            <form:select path="sinhVien.maSV" id="sinhVien" cssClass="form-control">
                                <form:option value="">-- Chọn sinh viên --</form:option>
                                <form:options items="${sinhviens}" itemValue="maSV" itemLabel="hoTen"/>
                            </form:select>
                            <form:errors path="sinhVien" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="khoaHoc" class="form-label">Khóa học <span class="text-danger">*</span></label>
                            <form:select path="khoaHoc.maKH" id="khoaHoc" cssClass="form-control">
                                <form:option value="">-- Chọn khóa học --</form:option>
                                <form:options items="${khoahocs}" itemValue="maKH" itemLabel="tenKH"/>
                            </form:select>
                            <form:errors path="khoaHoc" cssClass="text-danger"/>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Lưu
                            </button>
                            <a href="${pageContext.request.contextPath}/dangky" class="btn btn-secondary">
                                <i class="fas fa-times me-2"></i>Hủy
                            </a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div> 