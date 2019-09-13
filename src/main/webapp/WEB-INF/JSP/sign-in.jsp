<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="profile" tagdir="/WEB-INF/tags"%>

<div class="panel panel-info small-center-block">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-sign-in"></i> Login in your Account
		</h3>
	</div>
	<div class="panel-body">
		<form action="/sign-in-handler" method="post">
			<c:if test="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION != null}">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
				</div>
			</c:if>
			<div class="help-block">You can use UID or Email or Phone to login</div>
			<div class="form-group">
				<label for="uid">Login</label> <input id="uid" name="uid" class="form-control" placeholder="UID or Email or Phone" required autofocus>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input id="password" type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<div class="form-group">
				<label><input type="checkbox" name="remember-me" value="true"> Remember me</label>
			</div>
			<div class="form-group" style="display: table; width: 100%;">
				<button type="submit" class="btn btn-primary pull-left">Enter</button>
				<a href="#" class="pull-right">Restore login</a>
			</div>
			<div class="form-group text-center">
				<a href="/fbLogin" class="btn btn-warning">Login via Facebook</a>
			</div>
		</form>
	</div>
</div>