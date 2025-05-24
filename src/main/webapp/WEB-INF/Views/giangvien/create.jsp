<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-user-plus me-2"></i>Thêm giảng viên mới</h3>
                </div>
                <div class="card-body">
                    <form:form action="${pageContext.request.contextPath}/giangvien" 
                             method="POST" 
                             modelAttribute="giangviens">
                        
                        <div class="mb-3" <c:if test="${not empty fieldErrors.maGV}">has-error</c:if>>
                            <label for="maGV" class="form-label">Mã giảng viên <span class="text-danger">*</span></label>
                            <form:input path="maGV" 
                                       id="maGV"
                                       cssClass="form-control"/>
                            <form:errors path="maGV" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.hoTen}">has-error</c:if>>
                            <label for="hoTen" class="form-label">Họ tên <span class="text-danger">*</span></label>
                            <form:input path="hoTen" 
                                       id="hoTen"
                                       cssClass="form-control"/>
                            <form:errors path="hoTen" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.chucVu}">has-error</c:if>>
                            <label for="chucVu" class="form-label">Chức vụ <span class="text-danger">*</span></label>
                            <form:input path="chucVu" 
                                       id="chucVu"
                                       cssClass="form-control"/>
                            <form:errors path="chucVu" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.soDT}">has-error</c:if>>
                            <label for="soDT" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                            <form:input path="soDT" 
                                       id="soDT"
                                       cssClass="form-control"/>
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
                            <a href="${pageContext.request.contextPath}/giangvien" 
                               class="btn btn-secondary">
                                <i class="fas fa-times me-1"></i>Hủy
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i>Lưu
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div> 