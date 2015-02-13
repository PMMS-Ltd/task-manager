<g:each in="${people }" var="person">
	<h2>${person.givenName }</h2>
	<p>
		${person.uid }
	</p>
</g:each>