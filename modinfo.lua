name = "稻花村直连"
description = "听取咕声一片"
author = "颠三倒四"
version = "1.0.6"

forumthread = ""

api_version = 6  
api_version_dst = 10 

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

client_only_mod = true
all_clients_require_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

priority = 0

----------------------
-- General settings --
----------------------

local emptyoptions = {{description="", data=false}}
local function Breaker(title, hover)
	return {
		name=title,
		hover=hover, --hover does not work, as this item cannot be hovered
		options=emptyoptions,
		default=false,
	}
end

numoption = {}

for i=0,9 do
	numoption[#numoption + 1] = {
		description = i,
		data = i,
	}
end