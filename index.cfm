<h1>ActiveDirectory</h1>

<h2>Version 0.2</h2>

<p>ActiveDirectory is a plugin for the CFWheels framework that adds the helper functions detailed below, allowing developers to interact with Microsoft Active Directory Services.</p>

<h2>ActiveDirectoryAuthenticateUser</h2>

<h3>Description</h3>
<p>Authenticate domain, username and password against a Microsoft Windows Domain Controller via LDAP (Lightweight Directory Access Protocol).</p>
<h3>Returns</h3>

<p>A boolean value, with <em>True</em> indicating the user was successfully authenticated.</p>

<h3>Dependencies</h3>

<p>None.</p>
<h3>History</h3>
<p>version 0.1 - Initial implementation/proof of concept. </p>
<p>version 0.2 - Added port parameter so developer can override default value when necessary. Added index.cfm (this document). Reduced potential overhead by using mixin=controller.</p>
<h3>Function Syntax</h3>

<p>ActiveDirectoryAuthenticateUser (<em>username, password, domain, start, server, [port]</em> )</p>

<h3>Parameters</h3>

<table style="border: 1px #000 solid;" border="1">
<tr>
	<td><strong>Parameters</strong></td>
    <td><strong>Description</strong></td>
</tr>
<tr>
	<td>username</td>
    <td>(required) the user ID you want to authenticate.</td>
</tr>
<tr>
	<td>password</td>
    <td>(required) the password associated with the account you want to authenticate.</td>
</tr>
<tr>
	<td>domain</td>
    <td>(required) the Windows domain associated with the account you want to authenticate.</td>
</tr>
<tr>
	<td>start</td>
    <td>(required) where to start searching in Active Directory schema, e.g. dc=example,dc=com.</td>
</tr>
<tr>
	<td>server</td>
    <td>(required) Name of Active Directory domain controller with LDAP service</td>
</tr>
<tr>
	<td>port</td>
    <td>(optional) TCP port, defaults to 389</td>
</tr>
</table>
<br />
<h3>Examples</h3>

	<p>ActiveDirectoryAuthenticateUser(Form.login, Form.password, Form.domain, "dc=example,dc=com", "dc1.example.com")</p>
    <p>ActiveDirectoryAuthenticateUser(Form.login, Form.password, Form.domain, "dc=example,dc=com", "dc1.example.com", "3268")</p>