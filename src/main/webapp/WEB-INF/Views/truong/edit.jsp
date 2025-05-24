<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0"><i class="fas fa-edit me-2"></i>Chỉnh sửa thông tin trường</h3>
                </div>
                <div class="card-body">
                    <form:form method="POST" modelAttribute="truong">
                        <div class="mb-3" <c:if test="${not empty fieldErrors.maTruong}">has-error</c:if>>
                            <label for="maTruong" class="form-label">Mã trường</label>
                            <form:input path="maTruong" 
                                       id="maTruong"
                                       cssClass="form-control"
                                       readonly="true"/>
                            <form:errors path="maTruong" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.tenTruong}">has-error</c:if>>
                            <label for="tenTruong" class="form-label">Tên trường <span class="text-danger">*</span></label>
                            <form:input path="tenTruong" 
                                       id="tenTruong"
                                       cssClass="form-control"/>
                            <form:errors path="tenTruong" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.diaChi}">has-error</c:if>>
                            <label for="diaChi" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
                            <form:input path="diaChi" 
                                       id="diaChi"
                                       cssClass="form-control"/>
                            <form:errors path="diaChi" cssClass="text-danger"/>
                        </div>

                        <div class="mb-3" <c:if test="${not empty fieldErrors.sdt}">has-error</c:if>>
                            <label for="sdt" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                            <form:input path="sdt" 
                                       id="sdt"
                                       cssClass="form-control"/>
                            <form:errors path="sdt" cssClass="text-danger"/>
                        </div>

                        <div class="d-flex justify-content-end gap-2">
                            <a href="${pageContext.request.contextPath}/truong" 
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
