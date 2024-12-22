<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/FrontEndProfilePageCss.css" rel="stylesheet" />
</head>


<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>
	<div class="container">
		<div align=center>
			<h3>My Account</h3>
		</div>
	</div>

	<div class="container light-style flex-grow-1 container-p-y">

		<div class="card overflow-hidden">
			<div class="row no-gutters row-bordered row-border-light">
				<div class="col-md-3 pt-0">
					<div class="list-group list-group-flush account-settings-links">
						<a class="list-group-item list-group-item-action active"
							data-toggle="list" href="#account-general">General</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							id="changePassword" href="#account-change-password">Change
							password</a> <a class="list-group-item list-group-item-action"
							data-toggle="list" href="#account-info">Info</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-social-links">Social links</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-connections">Connections</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-notifications">Notifications</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="account-general">
							<div class="card-body">

								<table class="table table-sm">
									<tr>
										<td class="fw-bold">E-mail Address:</td>
										<td>${loggedCustomer.getEmail()}</td>
									</tr>
									<tr>
										<td class="fw-bold">First Name:</td>
										<td>${loggedCustomer.getFirstName()}</td>
									</tr>
									<tr>
										<td class="fw-bold">Last Name:</td>
										<td>${loggedCustomer.getLastName()}</td>
									</tr>
									<tr>
										<td class="fw-bold">Phone Number:</td>
										<c:if test="${loggedCustomer.getCustomerPhone() eq 'null'}">
											<td>Not Set</td>
										</c:if>
										<c:if test="${loggedCustomer.getCustomerPhone() ne 'null'}">
											<td>${loggedCustomer.getCustomerPhone()}</td>
										</c:if>

									</tr>
									<tr>
										<td class="fw-bold">Address Line 1:</td>
										<c:if test="${loggedCustomer.getAddress() eq null}">
											<td>Not Set</td>
										</c:if>
										<c:if test="${loggedCustomer.getAddress() ne null}">
											<td>${loggedCustomer.getAddress()}</td>
										</c:if>
									</tr>

									<tr>
										<td class="fw-bold">City:</td>
										<c:if test="${loggedCustomer.getCustomerCity() eq null}">
											<td>Not Set</td>
										</c:if>
										<c:if test="${loggedCustomer.getCustomerCity() ne null}">
											<td>${loggedCustomer.getCustomerCity()}</td>
										</c:if>

									</tr>
									<tr>
										<td class="fw-bold">State:</td>
										<c:if test="${loggedCustomer.getCustomerState() eq null}">
											<td>Not Set</td>
										</c:if>
										<c:if test="${loggedCustomer.getCustomerState() ne null}">
											<td>${loggedCustomer.getCustomerState()}</td>
										</c:if>

									</tr>
									<tr>
										<td class="fw-bold">Zip Code:</td>
										<c:if test="${loggedCustomer.getZipCode() eq 'null'}">
											<td>Not Set</td>
										</c:if>
										<c:if test="${loggedCustomer.getZipCode() ne 'null'}">
											<td>${loggedCustomer.getZipCode()}</td>
										</c:if>

									</tr>
									<tr>
										<td class="fw-bold">Country:</td>
										<c:if test="${loggedCustomer.getCountryName() eq null}">
											<td>Not Set</td>
										</c:if>

										<c:if test="${loggedCustomer.getCountryName() ne null}">
											<td>${loggedCustomer.getCountryName()}</td>
										</c:if>

									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td colspan="2" align="center"><b> <a
												href="edit_profile" data-mdb-toggle="modal"
												data-mdb-target="#customerUpdateModal"> Edit My Profile</a></b></td>
									</tr>
								</table>
							</div>

						</div>


						<div class="tab-pane fade" id="account-change-password">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Current password</label> <input
										type="password" class="form-control">
								</div>

								<div class="form-group">
									<label class="form-label">New password</label> <input
										type="password" class="form-control">
								</div>

								<div class="form-group">
									<label class="form-label">Repeat new password</label> <input
										type="password" class="form-control">
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="account-info">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Bio</label>
									<textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
								</div>
								<div class="form-group">
									<label class="form-label">Birthday</label> <input type="text"
										class="form-control" value="May 3, 1995">
								</div>
								<div class="form-group">
									<label class="form-label">Country</label> <select
										class="custom-select">
										<option>USA</option>
										<option selected="">Canada</option>
										<option>UK</option>
										<option>Germany</option>
										<option>France</option>
									</select>
								</div>


							</div>
							<hr class="border-light m-0">
							<div class="card-body pb-2">

								<h6 class="mb-4">Contacts</h6>
								<div class="form-group">
									<label class="form-label">Phone</label> <input type="text"
										class="form-control" value="+0 (123) 456 7891">
								</div>
								<div class="form-group">
									<label class="form-label">Website</label> <input type="text"
										class="form-control" value="">
								</div>

							</div>

						</div>
						<div class="tab-pane fade" id="account-social-links">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Twitter</label> <input type="text"
										class="form-control" value="https://twitter.com/user">
								</div>
								<div class="form-group">
									<label class="form-label">Facebook</label> <input type="text"
										class="form-control" value="https://www.facebook.com/user">
								</div>
								<div class="form-group">
									<label class="form-label">Google+</label> <input type="text"
										class="form-control" value="">
								</div>
								<div class="form-group">
									<label class="form-label">LinkedIn</label> <input type="text"
										class="form-control" value="">
								</div>
								<div class="form-group">
									<label class="form-label">Instagram</label> <input type="text"
										class="form-control" value="https://www.instagram.com/user">
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="account-connections">
							<div class="card-body">
								<button type="button" class="btn btn-twitter">
									Connect to <strong>Twitter</strong>
								</button>
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<h5 class="mb-2">
									<a href="javascript:void(0)"
										class="float-right text-muted text-tiny"><i
										class="ion ion-md-close"></i> Remove</a> <i
										class="ion ion-logo-google text-google"></i> You are connected
									to Google:
								</h5>
								nmaxwell@mail.com
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<button type="button" class="btn btn-facebook">
									Connect to <strong>Facebook</strong>
								</button>
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<button type="button" class="btn btn-instagram">
									Connect to <strong>Instagram</strong>
								</button>
							</div>
						</div>
						<div class="tab-pane fade" id="account-notifications">
							<div class="card-body pb-2">

								<h6 class="mb-4">Activity</h6>

								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											comments on my article</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											answers on my forum thread</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input"> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											follows me</span>
									</label>
								</div>
							</div>
							<hr class="border-light m-0">
							<div class="card-body pb-2">

								<h6 class="mb-4">Application</h6>

								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">News and announcements</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input"> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Weekly product updates</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Weekly blog digest</span>
									</label>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- Modal for edit customer profile details -->
	<div class="modal" id="customerUpdateModal" data-mdb-backdrop="static"
		data-mdb-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bgcolor">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="color: whitesmoke;">Edit customer Profile</h5>
					<button type="button" class="btn-close" data-mdb-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<!-- Form starts here -->
					<form class="mx-auto" id="customerDetailsUpdateForm" method="post"
						action="update_customer">
						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="text" id="firstName" class="form-control"
										value="${loggedCustomer.getFirstName()}" name="firstName" />
									<label class="form-label" for="firstName">First Name</label>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="text" id="lastName" class="form-control"
										value="${loggedCustomer.getLastName()}" name="lastName" /> <label
										class="form-label" for="lastName">Last Name</label>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="number" id="phoneNum" class="form-control"
										value="${loggedCustomer.getCustomerPhone()}" name="phoneNum" />
									<label class="form-label" for="phoneNum">Contact</label>
								</div>
							</div>
						</div>
						<hr />

						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="text" id="address" class="form-control"
										value="${loggedCustomer.getAddress()}" name="address" /> <label
										class="form-label" for="address">Address</label>
								</div>
							</div>
						</div>
						<hr />

						<div class="row">
							<div class="col">
								
									<select name="country" id="country" class="form-control select">

										<option disabled selected>Select Country</option>

										<c:forEach items="${mapCountries}" var="country">
											<option value="${country.value}"
												<c:if test='${Customer.getCustomerCountry() eq country.value}'>selected='selected'</c:if>>${country.key}
											</option>
										</c:forEach>
									</select> 
									
									<%-- <input type="text" id="country" class="form-control"
										value="${loggedCustomer.getCountryName()}" name="country" />
									<label class="form-label" for="country">Country</label> --%>
								
							</div>
						</div>
						<hr />

						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="text" id="state" class="form-control" name="state"
										value="${loggedCustomer.getCustomerState()}" /> <label
										class="form-label" for="state">State</label>
								</div>
							</div>
						</div>
						<hr />

						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="text" id="city" class="form-control" name="city"
										value="${loggedCustomer.getCustomerCity()}" /> <label
										class="form-label" for="city">City</label>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col">
								<div class="form-outline">
									<input type="number" id="zipCode" class="form-control"
										value="${loggedCustomer.getZipCode()}" name="zipCode" /> <label
										class="form-label" for="zipCode">Zip Code</label>
								</div>
							</div>
						</div>
						<hr />
						<div class="container" align=center>
							<button type="submit" class="btn btn-block" id="buttonInFrontEnd">Update
								Changes</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<br>
	<br>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	
	<script>
		$(document).ready(function() {
			$('#customerDetailsUpdateForm').validate({
				rules : {
					firstName : {
						required : true
					},
					lastName : {
						required : true
					},
					phoneNum : {
						required : true
					},
					address : {
						required : true
					},
					country : {
						required : true
					},
					state : {
						required : true
					},
					city : {
						required : true
					},
					zipCode : {
						required : true
					}
				}

			});
		})
	</script>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>