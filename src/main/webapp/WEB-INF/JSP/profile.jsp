<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="profile" tagdir="/WEB-INF/tags"%>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-sm-6">
			<profile:profile-main />
			<div class="hidden-xs">
				<profile:profile-languages />
				<profile:profile-hobbies />
				<profile:profile-info />
			</div>
		</div>
		<div class="col-md-8 col-sm-6">
			<profile:profile-objective />
			<profile:profile-skills />
			<profile:profile-practics />
			<profile:profile-certificates />
			<profile:profile-cources />
			<profile:profile-education />
		</div>
		<div class="col-xs-12 visible-xs-block">
			<profile:profile-languages />
			<profile:profile-hobbies />
			<profile:profile-info />
		</div>
	</div>
</div>