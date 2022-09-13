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
  param name="objectparams.masatranslationstooltype" default="list";

  pluginpath = m.globalConfig('context') & '/plugins/MasaTranslations';
	pluginConfig = m.getPlugin('MasaTranslations');
	translationManager = CreateObject('component', 'MasaTranslations.cfcs.translationManager').init(m.globalConfig(),pluginConfig);
	rsLocales = translationManager.getAssignedSites(m.siteConfig('siteid'));
</cfscript>
<cfoutput>
  <cfif rsLocales.recordcount>
    <cfif objectparams.masatranslationstooltype eq 'selectbox'>
      <select class="form-control translations-nav" onchange="location.href=this.value;">
        <option value="">
          #esapiEncode('html', translationManager.getTranslationKeys().setSiteID(m.siteConfig('siteid')).load().getSelectorLabel())#
        </option>
        <cfloop query="rslocales">
          <cfset theURL =translationManager.lookUpTranslation(m.event('crumbdata'), rsLocales.siteid)/>
          <option value="#esapiEncode('html_attr', theURL)#">
            #esapiEncode('html', rsLocales.alias)#
          </option>
        </cfloop>
      </select>
    <cfelse>
      <!--- List --->
      <cfset selectorLabel=translationManager.getTranslationKeys().setSiteID(m.siteConfig('siteid')).load().getSelectorLabel() />
      <div class="translations-nav navSecondary plugIn<cfif YesNoFormat(pluginConfig.getSetting('showFlags'))> showFlags</cfif>">
        <cfif len(selectorLabel)>
          <h3>#esapiEncode('html', selectorLabel)#</h3>
        </cfif>
  
        <ul>
          <cfloop query="rslocales">
            <cfsilent>
              <cfset javaLocale=lcase(listLast(m.getBean('settingsManager').getSite(rsLocales.siteid).getJavaLocale(),"_"))>
              <cfset theURL = translationManager.lookUpTranslation(m.event('crumbdata'), rsLocales.siteid)/>
              <cfset class="">
              <cfif rsLocales.currentrow eq 1>
                <cfset class="first">
              </cfif>
              <cfif rsLocales.currentrow eq rsLocales.recordcount>
                <cfset class=listAppend(class,"last"," ")>
              </cfif>
            </cfsilent>
            <li class="#javaLocale#<cfif len(class)> #class#</cfif>">
              <a href="#esapiEncode('html_attr', theURL)#">
                #esapiEncode('html', rsLocales.alias)#
              </a>
            </li>
          </cfloop>
        </ul>
      </div>
    </cfif>

    <script>
      Mura(function(m) {
        m.loader()
          .loadcss('#pluginPath#/css/ltm.css', {media:'all'});
      });
    </script>
  </cfif>
</cfoutput>
