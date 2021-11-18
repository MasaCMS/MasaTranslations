<cfoutput>
	
CREATE TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" 
   (	"MAPID" CHAR(35), 
	"LOCALID" CHAR(35), 
	"LOCALSITEID" VARCHAR2(25),
	"REMOTEID" CHAR(35),
	"REMOTESITEID" VARCHAR2(25)
   );
	

ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" ADD CONSTRAINT "#ucase('p#variables.config.getPluginID()#_translationmaps')#_MAPID" PRIMARY KEY ("MAPID") ENABLE;
ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" MODIFY ("MAPID" NOT NULL ENABLE);
ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" MODIFY ("LOCALSITEID" NOT NULL ENABLE);
ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" MODIFY ("LOCALID" NOT NULL ENABLE);
ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" MODIFY ("REMOTESITEID" NOT NULL ENABLE);
ALTER TABLE "#ucase('p#variables.config.getPluginID()#_translationmaps')#" MODIFY ("REMOTEID" NOT NULL ENABLE);

CREATE INDEX "#ucase('p#variables.config.getPluginID()#_translationmaps')#_from" ON "#ucase('p#variables.config.getPluginID()#_translationmaps')#" ("LOCALSITEID","LOCALID");

CREATE INDEX "#ucase('p#variables.config.getPluginID()#_translationmaps')#_to" ON "#ucase('p#variables.config.getPluginID()#_translationmaps')#" ("REMOTESITEID","REMOTEID");
</cfoutput>