<html>
<head>
<style type="text/css">
    tr td {
		padding: 10px;
	}
	form {
		margin-top: 20px;
	}
</style>
</head>
<body>
	<h3>Index page for Persons:</h3>
	<form>
		% if c.persons:
		<table>
			<tr><th>Id</th><th>Name</th><th>Email</th><th>Update</th><th>Delete</th></tr>
		% for person in c.persons:
			<tr>
				<td>${person.id}</td>
				<td><input type="textbox" value="${person.name}"/></td>
				<td><input type="textbox" value="${person.email}"/></td>
				<td><input type="button" value="Update" onclick="update_person(this.form, ${person.id}, ${person.name}, ${person.email})"/></td>
				<td><input type="button" value="Delete" onclick="delete_person(this.form, ${person.id})"/></td>
		% endfor
		</table>
		<input type="hidden" name="name"/>
		<input type="hidden" name="email"/>
		% endif
	</form>
	<form>
		<span> name: </span>
		<input type="textbox" name="name"/>
		<span> email:</span>
		<input type="textbox" name="email"/>
		<input type="submit" value="Create new person" onclick="create_person(this.form, this.form.name.value, this.form.email.value);" />
	</form>
</body>

<script type="text/javascript">
	function create_person(form, name, email) {
		form.action = "/person/create/" + name + "/" + email;
		form.submit();
	}
	function update_person(form, id, name, email) {
		form.action = "/person/save/" + id;
		form.name.value = name;
		form.email.value = email;
		form.submit();
	}
	function delete_person(form, id) {
		form.action = "/person/delete/" + id;
		form.submit();
	}
</script>

</html>
