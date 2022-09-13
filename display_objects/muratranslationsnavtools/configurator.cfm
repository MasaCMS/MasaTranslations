<cfscript>
/**
*
* This file is part of Masa CMS Translations Plugin
*
* Copyright 2011-2016 Blue River Interactive
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
  param name="objectparams.async" default="true";
  param name="objectparams.render" default="server";
  param name="objectparams.masatranslationstooltype" default="list";
</cfscript>
<cfsavecontent variable="data.html">
	<cf_objectconfigurator params="#objectparams#">
	<cfoutput>
	<div class="mura-control-group">
			<label class="mura-control-label" for="masatranslationstooltype">Tool Type</label>
			<label class="radio inline">
				<input type="radio" class="objectParam" name="masatranslationstooltype" value="list" <cfif objectparams.masatranslationstooltype eq 'list'> checked="checked"</cfif> />
				List
			</label>
			<label class="radio inline">
				<input type="radio" class="objectParam" name="masatranslationstooltype" value="selectbox" <cfif objectparams.masatranslationstooltype eq 'selectbox'> checked="checked"</cfif> />
				SelectBox
			</label>
		</div>
	</cfoutput>
	</cf_objectconfigurator>
</cfsavecontent>
<cfoutput>#createObject("component","mura.json").encode(data)#</cfoutput>
<cfabort>
