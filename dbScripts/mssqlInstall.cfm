<cfoutput>
CREATE TABLE [dbo].[p#variables.config.getPluginID()#_translationmaps] (
	[mapID] [char] (35) NOT NULL ,
	[localSiteID] [nvarchar] (25) NOT NULL,
	[localID] [char] (35) NOT NULL ,
	[remoteSiteID] [nvarchar] (25) NOT NULL,
	[remoteID] [char] (35) NOT NULL 
) ON [PRIMARY] 


ALTER TABLE [dbo].[p#variables.config.getPluginID()#_translationmaps] WITH NOCHECK ADD 
	CONSTRAINT [p#variables.config.getPluginID()#_PK_translationmaps] PRIMARY KEY  CLUSTERED 
	(
		[mapID]
	)  ON [PRIMARY] 
	
CREATE  INDEX [p#variables.config.getPluginID()#_IDX_translationmaps_from] ON [dbo].[p#variables.config.getPluginID()#_translationmaps]([localSiteID], [localID]) ON [PRIMARY]


</cfoutput>