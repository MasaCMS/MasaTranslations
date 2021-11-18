<cfoutput>
DROP TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" cascade constraints;
DROP TABLE "#ucase('p#variables.config.getPluginID()#_translationkeys')#" cascade constraints;
DROP TABLE "#ucase('p#variables.config.getPluginID()#_translationexports')#" cascade constraints;
</cfoutput>