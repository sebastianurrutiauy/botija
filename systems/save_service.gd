extends RefCounted
## Schema 1 stays compatible with the original prototype.
static func write(path: String, state: Resource) -> Error:
	var file := FileAccess.open(path,FileAccess.WRITE)
	if not file:
		return FileAccess.get_open_error()
	file.store_string(JSON.stringify({"version":1,"outdoors":state.outdoors,"room":state.room,"visited":state.visited,"lanterns":state.lanterns,"lights":state.room_lit,"garden":state.garden_seen,"complete":state.complete}))
	return OK

static func read(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var data = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not data is Dictionary or data.get("version",0)!=1:
		return {}
	for key in ["visited","lanterns","lights"]:
		if not data.get(key) is Array or data[key].size()!=(3 if key=="lanterns" else 4):
			return {}
		for value in data[key]:
			if not value is bool:
				return {}
	if not data.get("outdoors") is bool or not data.get("room") is float and not data.get("room") is int:
		return {}
	var loaded_room := int(data["room"])
	if loaded_room<0 or loaded_room>3:
		return {}
	if float(data["room"]) != float(loaded_room):
		return {}
	for key in ["garden", "complete"]:
		if not data.get(key, false) is bool:
			return {}
	return data
