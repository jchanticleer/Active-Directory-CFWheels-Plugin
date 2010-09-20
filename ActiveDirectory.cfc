<cfcomponent output="false" mixin="controller">

<cffunction name="init">

    <cfset this.version = "1.0.5,1.1">
    <cfreturn this>

</cffunction>

<cffunction name="ActiveDirectoryAuthenticateUser" returntype="boolean" access="public" output="false">
    <cfargument name="username" required="yes" type="string">
    <cfargument name="password" required="yes" type="string">
    <cfargument name="domain" required="yes" type="string">
    <cfargument name="start" required="yes" type="string">
    <cfargument name="server" required="yes" type="string">
    <cfargument name="port" required="no" type="string" default="389">

    <!--- CFLDAP code to authenticate a user id, domain and password --->
    <cftry>					
        <cfldap 
        action="query" 
        name="validateUser" 
        start="#arguments.start#" 
        scope="Subtree" 
        attributes="cn" 
        server="#arguments.server#" 
        port="#arguments.port#" 
        filter="(&(objectclass=user)(samaccountname=#username#))" 
        username="#arguments.domain#\#arguments.username#" 
        password="#arguments.password#">
				
        <cfcatch type="application">
            <!--- Something has gone wrong. Could be user typed bad password or offline LDAP server, etc.
            we don't know exact cause, only that we were unable to authenticate this user --->
        </cfcatch>
    </cftry>

    <cfif IsDefined("validateUser.recordCount")>
        <cfreturn true>
    <cfelse>
        <cfreturn false>
    </cfif>

</cffunction>

</cfcomponent>