\version "2.25.32"
\language "français"

\header {
  title = "Hot Lava Sex Machine"
  composer = "Gallowstreet"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

fourMeasuresRest = \compressMMRests {
  \override MultiMeasureRest.expand-limit = #1
  R1*4
}

crossStickGroove = \drummode {
  <<
    \relative { \repeat unfold 16 hh16 }
    \\
    \relative { r8 ss8. ss8. r8 ss8 8 8 }
  >>
}

crossStickGrooveEnd = \drummode {
  <<
    \relative { \repeat unfold 12 { hh16 } sn4 }
    \\
    \relative { r8 ss8. ss8. r8 ss8 s4 }
  >>
}

accentsGroove = \drummode {
  <<
    \relative { \repeat unfold 4 { hh16 16 16-> 16 } }
    \\
    \relative { bd8. 16 sn8 bd r16 bd16 8 sn8. 32 32 }
  >>
}

accentsGrooveEnd = \drummode {
  <<
    \relative { \repeat unfold 2 { hh16 16 16-> 16 } hh sn sn sn sn sn sn sn }
    \\
    \relative { bd8. 16 sn8 bd r16 s8. s4 }
  >>
}

openHiHatGrooveStart = \drummode {
  <<
    \relative { sn16 16 hho8 \repeat unfold 12 hh16 }
    \\
    \relative { r8 bd8 <ss hhp>8. bd16 r16 bd16 8 ss4 }
  >>
}

openHiHatGroove = \drummode {
  <<
    \relative { hh16 16 hho8 \repeat unfold 12 hh16 }
    \\
    \relative { bd8 8 <ss hhp>8. bd16 r16 bd16 8 ss4 }
  >>
}

closedHiHatGroove = \drummode {
  <<
    \relative { \repeat unfold 16 hh16 }
    \\
    \relative { bd8 8 sn8. bd16 r16 bd16 8 sn4 }
  >>
}

closedHiHatGrooveWithRest = \drummode {
  <<
    \relative { r8 \repeat unfold 14 hh16 }
    \\
    \relative { r8 bd8 sn8. bd16 r16 bd16 8 sn4 }
  >>
}

openHiHatGrooveWithSnare = \drummode {
  <<
    \relative { hh16 16 hho8 \repeat unfold 12 hh16 }
    \\
    \relative { bd8 8 <sn hhp>8. bd16 r16 bd16 8 sn4 }
  >>
}

openHiHatGrooveEnd = \drummode {
  <<
    \relative { hh16 16 hho8 \repeat unfold 8 hh16 }
    \\
    \relative { bd8 8 <sn hhp>8 bd sn }
  >>
}

threeMeasuresRest = \compressMMRests {
  \override MultiMeasureRest.expand-limit = #1
  R1*3
}

middleBreak = \drummode {
  \relative { }
  \\
  \relative { r4 r8. sn16 \repeat unfold 2 { sn <bd hho> hhp sn } }
}

twoMeasuresRest = \compressMMRests {
  \override MultiMeasureRest.expand-limit = #1
  R1*2
}

finalBreak = \drummode {
  <<
    \relative { sn16 16 cymc4. }
    \\
    \relative { r8 bd4. }
  >>
}

\score {
  \layout {
    #(layout-set-staff-size 24)
  }

  \new DrumStaff <<
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \tempo 4 = 90
      \textMark "Intro"
      \fourMeasuresRest
      \break

      \mark 1
      \repeat percent 7 \crossStickGroove
      \crossStickGrooveEnd
      \break
      
      \mark 2
      \repeat percent 7 \accentsGroove
      \accentsGrooveEnd
      \break

      \tempo 4 = 77
      \mark 3
      \repeat percent 4 {
        \openHiHatGrooveStart
        \repeat percent 3 \openHiHatGroove
      }
      \break
      
      \mark 4
      \repeat percent 4 \closedHiHatGroove
      \break
      \closedHiHatGrooveWithRest
      \repeat percent 3 \closedHiHatGroove
      \break

      \mark 5
      \repeat percent 3 {
        \closedHiHatGroove
        \openHiHatGrooveWithSnare
      }
      \closedHiHatGroove
      \time 3/4
      \openHiHatGrooveEnd
      \tempo 4 = 79
      \time 4/4
      \threeMeasuresRest
      \middleBreak
      \break
      
      \mark 2
      \repeat percent 8 {
        \repeat percent 4 \accentsGroove
      }
      \break
      
      \mark 1
      \twoMeasuresRest
      \repeat percent 5 \crossStickGroove
      \crossStickGrooveEnd
      \break

      \mark 2
      \repeat percent 11 \accentsGroove
      \accentsGrooveEnd
      \finalBreak
    }
  >>
}
