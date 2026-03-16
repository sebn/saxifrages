\version "2.25.32"
\language "français"

\header {
  title = "Asterix"
  composer = "Gallowstreet"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

% GROOVES

baseGroove = \drummode {
  bd16 bd8. sn8-> bd16 bd ~ bd \parenthesize sn8. sn8.-> \parenthesize sn16
}

hihatGroove = \drummode {
  <<
    \relative { r8 hh-> r hh-> r hh-> r hh-> }
    \\
    \relative { \baseGroove }
  >>
}

hihatGrooveWithCrash = \drummode {
  <<
    \relative { cymc8 hh-> r hh-> r hh-> r hh-> }
    \\
    \relative { \baseGroove }
  >>
}

hihatGrooveWithBreak = \drummode {
  <<
    \relative { r8 hh-> r hh-> r2 }
    \\
    \relative { bd16 bd8. sn8 bd16 bd ~ bd sn sn8 sn16 sn sn8 }
  >>
}

rideGroove = \drummode {
  <<
    \relative { cymr8 8 8 8 8 8 8 8 }
    \\
    \relative { \baseGroove }
  >>
}

crashBreak = \drummode {
  <<
    \relative { s1 }
    \\
    \relative { \repeat unfold 2 { bd8 bd <sn cymc>4 } }
  >>
}

hihatPulse = \drummode {
  <<
    \relative { r1 }
    \\
    \relative { hhp4 4 4 4 }
  >>
}

baseBell = \drummode {
  cb8 cb cb cymc16 cb ~ cb cb cb8 cb cymc
}

bellGrooveWithoutDrums = \drummode {
  <<
    \relative { \baseBell }
    \\
    \relative { hhp4 4 4 4 }
  >>
}

bellGrooveWithDrums = \drummode {
  <<
    \relative { \baseBell }
    \\
    \relative { <\parenthesize hhp bd>4 <\parenthesize hhp sn> \parenthesize hhp8 bd <\parenthesize hhp sn>4 }
  >>
}

baseRoll = \drummode {
  <\parenthesize hhp sn>16 sn sn8
}

% SCORE

\score {
  \new DrumStaff <<
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \textMark "Swing"
      \compressMMRests {
        \override MultiMeasureRest.expand-limit = #1
        R1*3
      }
      \textMark "Hihat"
      \hihatGroove
      \bar "||"
      \break

      \textMark "Hihat"
      \repeat percent 4 {
        \repeat percent 4 { \hihatGroove }
        \break
      }
      \break
      \repeat percent 3 {
        \repeat percent 4 { \hihatGrooveWithCrash }
        \break
      }
      \break
      \repeat percent 3 { \hihatGroove }
      \hihatGrooveWithBreak
      \bar "||"
      \break
      \textMark "Ride"
      \repeat percent 2 {
        \repeat percent 4 { \rideGroove }
      }
      \bar "||"
      \break
      \textMark "Hihat"
      \repeat percent 5 {
        \repeat percent 4 { \hihatGrooveWithCrash }
      }
      \break
      \repeat percent 3 { \hihatGroove }
      \hihatGrooveWithBreak
      \bar "||"
      \break
      \hihatPulse
      \repeat percent 5 { \hihatGroove }
      \textMark "Crash"
      \crashBreak
      \bar "||"
      \break
      \repeat percent 2 {  \hihatPulse }
      \textMark "Crash bell"
      \repeat percent 2 { \bellGrooveWithoutDrums }
      \repeat percent 4 {
        \repeat percent 4 { \bellGrooveWithDrums }
      }
      \bar "||"
      \break
      \textMark "Crash"
      \crashBreak
      bd8 bd <sn cymc>8. sn16 bd8 bd bd16 <sn cymc>8.
      \crashBreak
      bd8 bd <sn cymc> bd16 bd ~ bd bd8 bd16 ~ bd <sn cymc>8.
      \break
      \repeat percent 3 {
        \repeat unfold 2 { bd16 \parenthesize bd bd8 <sn cymc>16 sn sn8 }
      }
      \baseRoll -\< \baseRoll \baseRoll \baseRoll \baseRoll \baseRoll \baseRoll -\! \baseRoll
      \bar "||"
      \break
      \textMark "Hihat" 
      \repeat percent 5 {
        \repeat percent 2 {
          <<
            \relative { r4 r8 hh-> r hh-> r hh-> }
            \\
            \relative { \parenthesize hhp4 sn8-> bd16 bd ~ bd \parenthesize sn8. sn8.-> \parenthesize sn16 }
          >>
        }
      }
      \break
      \textMark "Crash"
      \crashBreak
      <sn sn>8 8 bd sn16 16 ~ 16 8 16 ~ 16 \textMark "Crash stop" <sn cymc> r8
      \bar "|."
    }
  >>
}