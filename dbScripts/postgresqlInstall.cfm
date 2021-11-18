<cfoutput>
CREATE TABLE p#variables.config.getPluginID()#_translationmaps (
	mapID char(35) NOT NULL,
	localSiteID varchar(25) NOT NULL,
	localID char(35) NOT NULL,
	remoteSiteID varchar(25) NOT NULL,
	remoteID char(35) NOT NULL,
	CONSTRAINT PK_p#variables.config.getPluginID()#_translationmaps PRIMARY KEY (mapID)
);

CREATE INDEX
	p#variables.config.getPluginID()#_translationmaps_from
ON
	p#variables.config.getPluginID()#_translationmaps(localSiteID,localID);

CREATE INDEX
	p#variables.config.getPluginID()#_translationmaps_to
ON
	p#variables.config.getPluginID()#_translationmaps(remoteSiteID,remoteID);
</cfoutput>