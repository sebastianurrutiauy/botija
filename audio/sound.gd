class_name ExplorationSound
extends AudioStreamPlayer
## Sonidos sintetizados localmente: no requieren assets externos.
func tone(kind: String) -> void:
	var sample_rate := 22050
	var duration := 0.22
	if kind == "meow":
		duration = 0.48
	var count := int(sample_rate * duration)
	var bytes := PackedByteArray()
	bytes.resize(count * 2)
	for i in range(count):
		var t := float(i) / sample_rate
		var f := 660.0
		if kind == "meow":
			f = 580.0 + sin(t / duration * PI) * 280.0
		elif kind == "metal":
			f = 1300.0
		elif kind == "success":
			f = 660.0 if t < 0.1 else 880.0
		var envelope := sin(PI * t / duration) * exp(-t * 4.0)
		var value := sin(TAU * f * t) * envelope * 0.22
		if kind == "metal":
			value += sin(TAU * 2137.0 * t) * envelope * 0.12
		bytes.encode_s16(i * 2, int(clampf(value, -1.0, 1.0) * 32767))
	var wav := AudioStreamWAV.new()
	wav.format = AudioStreamWAV.FORMAT_16_BITS
	wav.mix_rate = sample_rate
	wav.data = bytes
	stream = wav
	volume_db = -10.0
	play()

