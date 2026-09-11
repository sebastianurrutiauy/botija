class_name SessionState
extends Resource
## One session; the same instance is injected into the world and game coordinator.
var outdoors: bool = true
var room: int = 0
var visited: Array[bool] = [false,false,false,false]
var garden_seen: bool = false
var complete: bool = false
var lanterns: Array[bool] = [false,false,false]
var room_lit: Array[bool] = [true,true,true,true]
var ambience_soft: bool = true
