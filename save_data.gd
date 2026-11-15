class_name SaveData
extends RefCounted
## Tiny helper that saves and loads the best score.

const PATH: String = "user://bounce_save.cfg"

static func get_best() -> int:
	var cfg := ConfigFile.new()
	if cfg.load(PATH) != OK:
		return 0
	return int(cfg.get_value("scores", "best", 0))

## Returns true if `score` is a new record (and saves it).
static func submit(score: int) -> bool:
	if score <= get_best():
		return false
	var cfg := ConfigFile.new()
	cfg.set_value("scores", "best", score)
	cfg.save(PATH)
	return true
