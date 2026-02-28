\version "2.25.32"
\language "français"

\header {
  title = "Brooklyn"
  composer = "Youngblood Brass Band"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

% GROOVES

crossStickGroove = \drummode {
  <<
    \relative { hh8 8 8 8 8 8 8 8 }
    \\
    \relative { bd8. 16 ss8 bd r bd ss16 bd8. }
  >>
}

rideGroove = \drummode {
  <<
    \relative { cymr8 8 8 8 8 rb8 8 8 }
    \\
    \relative { bd8 16 sn~ sn8 bd r bd sn16 bd8. }
  >>
}

openClosedHiHatGroove = \drummode {
  <<
    \relative { hho8-> 8-> 8-> 8-> hh8 8 8 8 }
    \\
    \relative { bd8 16 sn~ sn bd sn8 bd bd sn16 bd8. }
  >>
}

% BREAKS

stopBreak = \drummode {
  <<
    \relative { <sn sn>8-> hho8-> 8-> 8-> <sn sn>4-> s8 sn8 }
    \\
    \relative { sn8 bd8~ 16 8. sn4 r8 sn8 }
  >>
}

rollingBreak = \drummode {
  <<
    \relative { <sn sn>8-> hho8-> 8-> 8-> sn16\< 16 16 16 16 16 16 16\! }
    \\
    \relative { sn8 bd8~ 16 8. s2 }
  >>
}

ending = \drummode {
  <<
    \relative { cymr2:32 s2 }
    \\
    \relative { bd2 r2 }
  >>
}

% LINES

introLine = {
  \drummode {
    \repeat volta 2 {
      \repeat percent 2 {
        <<
          \relative { hho8.-> 16~-> 8 hh8-> r4 <sn sn>4-> }
          \\
          \relative { bd8 sn16 bd~ bd sn <bd hhp>8 r4 sn4 }
        >>
      }
      <<
        \relative { hho8.-> 16~-> 8 hh8-> r8 <sn sn>-> <sn sn>8-> r8 }
        \\
        \relative { bd8 sn16 bd~ bd sn <bd hhp>8 r8 sn8 8 r16 bd16 }
      >>
      <<
        \relative { <sn sn>8 hh8 8 8 8 hho-> sn16 hho8-> sn16 }
        \\
        \relative { sn8 bd8~ 16 8. sn8 bd sn16 bd8 sn16 }
      >>
    }
    \break
  }
}

crossStickLine = {
  \textMark "cross-stick"
  \repeat volta 2 {
    \repeat percent 4 { \crossStickGroove }
  }
  \break
}

rideLine =
  #(define-music-function (break) (ly:music?)
     #{
       \textMark "ride"
       \repeat volta 2 {
         <<
           \repeat percent 3 { \rideGroove }
         >>
         \alternative {
           \volta 1 { \rideGroove }
           \volta 2 { #break }
         }
       }
       \break
     #})

openClosedHiHatLine = {
  \textMark "open/closed hi-hat"
  \repeat volta 2 {
    <<\repeat percent 3 { \openClosedHiHatGroove }>>
    \alternative {
      \volta 1 { \openClosedHiHatGroove }
      \volta 2 { \stopBreak }
    }
  }
  \break
}

crashLine = {
  \drummode {
    \textMark "crash"
    \repeat volta 2 {
      \repeat percent 2 {
        <<
          \relative { cymc4-> 4-> 4-> 4-> }
          \\
          \relative { bd8. 16 sn8 bd r bd sn16 bd8. }
        >>
      }
      <<
        \relative { cymc8-> sn16 cymc->~ cymc sn cymc8-> r sn cymc4-> }
        \\
        \relative { bd8 sn16 bd~ bd sn bd8 r sn sn8. bd16 }
      >>
      \alternative {
        \volta 1 {
          <<
            \relative { cymc4-> 4-> r8 cymc-> sn16 cymc8-> sn16 }
            \\
            \relative { sn8 bd r bd sn bd sn16 bd8 sn16 }
          >>
        }
        \volta 2 {
          <<
            \relative { cymc4-> 4-> 4-> s }
            \\
            \relative { sn8 bd r bd sn bd sn16\> 16 tomfh8\! }
          >>
        }
      }
    }
  }
}

% SCORE

\score {
  \new DrumStaff <<
    \tempo 4 = 100
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \mark 1
      \introLine
      \set Score.currentBarNumber = 9
      \openClosedHiHatLine

      \mark 2
      \set Score.currentBarNumber = 17
      \crossStickLine

      \mark 3
      \set Score.currentBarNumber = 25
      \rideLine \stopBreak

      \mark 4
      \set Score.currentBarNumber = 33
      \openClosedHiHatLine

      \mark 2
      \set Score.currentBarNumber = 41
      \crossStickLine

      \mark 3
      \set Score.currentBarNumber = 49
      \rideLine \rollingBreak

      \mark 5
      \set Score.currentBarNumber = 57
      \crashLine

      \set Score.currentBarNumber = 65
      \ending
    }
  >>
}
