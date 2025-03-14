<!--- Add alternate links to HTML <head> for SEO purposes --->
<cfscript>
	pluginConfig = m.getPlugin('MasaTranslations');
	translationManager = CreateObject('component', 'MasaTranslations.cfcs.translationManager').init(m.globalConfig(),pluginConfig);
	rsLocales = translationManager.getAssignedSites(m.siteConfig('siteid'));
	hasTranslation = translationManager.hasTranslation(m.getContentID(),m.siteConfig('siteid'))
</cfscript>

<cfif hasTranslation>
	<cfsavecontent variable="extraLinks">
		<cfoutput>
			<!--- link to the page itself --->
			<cfsilent>
				<cfset language = lcase(replace(application.rbFactory.CF2Java(m.siteconfig().getSiteLocale()), "_", "-"))>
				<cfset theURL = m.getCurrentURL()>
			</cfsilent>
			<link rel="alternate" hreflang="#language#" href="#theURL#">

			<!--- link to the page in other languages --->
			<cfloop query="rslocales">
				<cfsilent>
					<cfset language = lcase(replace(m.getBean('settingsManager').getSite(rsLocales.siteid).getJavaLocale(), "_", "-"))>
					<cfset theURL = translationManager.lookUpTranslation(m.event('crumbdata'), rsLocales.siteid)>
				</cfsilent>
				<link rel="alternate" hreflang="#language#" href="#theURL#">
			</cfloop>
		</cfoutput>
	</cfsavecontent>
	<cfhtmlhead text="#extraLinks#">
</cfif>