extends Area2D
var fading = false
var x = 0
var y = 6
var playlevel2 = false

func _ready():
	$level2.volume_db = -10

func _process(delta):
	if fading == true:
		$cave.volume_db -= delta * 3
		x += 1
		if x == 200:
			$cave.stop()

	if y >= 0 and playlevel2 == true:
		x -= 1
		$level2.volume_db += delta * 4
		if $level2.volume_db > 2:
			playlevel2 = false
		
func _on_MusicDetectors_body_entered(_body):
	$cave.play()
	$cave.volume_db = 1

func _on_MusicDetectors_body_exited(_body):
	fading = true
	$level2.play()
	playlevel2 = true
	$level2.volume_db = -100
