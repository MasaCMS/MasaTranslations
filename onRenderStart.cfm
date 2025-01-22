<!--- Add alternate links to HTML <head> for SEO purposes --->
<cfscript>
	pluginConfig = m.getPlugin('MasaTranslations');
	translationManager = CreateObject('component', 'MasaTranslations.cfcs.translationManager').init(m.globalConfig(),pluginConfig);
	rsLocales = translationManager.getAssignedSites(m.siteConfig('siteid'));
</cfscript>
<cfsavecontent variable="extraLinks">
<cfloop query="rslocales">
	<cfsilent>
	  <cfset javaLocale=m.getBean('settingsManager').getSite(rsLocales.siteid).getJavaLocale()>
	  <cfset theURL = translationManager.lookUpTranslation(m.event('crumbdata'), rsLocales.siteid)/>
	</cfsilent>
<cfoutput>
		<link rel="alternate" hreflang="#javaLocale#" href="#theURL#" />
</cfoutput>
  </cfloop>
</cfsavecontent>
<cfhtmlhead text="#extraLinks#">