OUTFILE := bin/paulstretch
SOURCES := \
	BinauralBeats.cpp \
	Control.cpp \
	FreeEdit.cpp \
	globals.cpp \
	Input/AInputS.cpp \
	Input/MP3InputS.cpp \
	Input/VorbisInputS.cpp \
	JAaudiooutput.cpp \
	Mutex.cpp \
	Output/AOutputS.cpp \
	Output/VorbisOutputS.cpp \
	PAaudiooutput.cpp \
	Player.cpp \
	ProcessedStretch.cpp \
	Stretch.cpp \
	Thread.cpp \
	XMLwrapper.cpp

${OUTFILE}: GUI.cxx FreeEditUI.cxx ${SOURCES}
	mkdir -p $(@D)
	$(CXX) \
		-o $@ \
		$^ \
		-laudiofile \
		-lfftw3f \
		-lmad \
		-lmxml \
		-logg \
		-lportaudio \
		-lpthread \
		-lsamplerate \
		-lvorbis \
		-lvorbisenc \
		-lvorbisfile \
		-lz \
		$(shell fltk-config --cflags) \
		$(shell fltk-config --ldflags) \
		-DENABLE_RESAMPLING


GUI.cxx: GUI.fl
	fluid -c $<

FreeEditUI.cxx: FreeEditUI.fl
	fluid -c $<
