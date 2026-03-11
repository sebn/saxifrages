\version "2.25.32"
\language "français"

\header {
  title = "Dancing Sax"
  composer = "Fabrice Binoit"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

intro = {
  \drummode {
    \textMark "Intro"

    \repeat volta 4 {
      <<
        \relative { hh8^⚬ 16^⚬ 16^• 8 16 16 8 16 16 8 16 16 }
        \\
        \relative { bd4 \f bd4 r4 r8 bd }
      >>
      \alternative {
        \volta 1,2,3 {
          <<
            \relative { hh8 16 16 sn8^⚬ hh16^⚬ 16^• 8 16 16 sn8^⚬ 16^⚬ 16^• }
            \\
            \relative { r8 bd sn bd r bd sn4  }
          >>
        }
        \volta 4 {
          <<
            \relative { hh8 16 16 sn4 <sn sn>8-> <sn sn>-> tomfh4-> }
            \\
            \relative { r8 bd sn bd s2 }
          >>
        }
      }
    }
  }
}

theme = {
  \drummode {
    \break
    \mark 1
    \repeat volta 2 {
      \repeat volta 4 {
        <<
          \relative { cymc8^⚬ hh16^⚬ 16^• sn8^⚬ hh16^⚬ 16^• 8 16 16 sn8 hh16 16  }
          \\
          \relative { bd4 \f sn r8 bd sn bd }
        >>
      }
      \alternative {
        \volta 1,2,3 {
          <<
            \relative { hh8 16 16 sn8 hh16 16 8 16 16 sn8 hh16 16 }
            \\
            \relative { r4 sn bd8 8 sn4 }
          >>
        }
        \volta 4 {
          <<
            \relative { sn8^⚬ hho^• sn hho sn hho^• <sn tomh>^⚬^•-> tomfh^⚬-> }
            \\
            \relative { sn8 bd sn bd sn bd sn tomfh }
          >>
        }
      }
    }
  }
}

openHiHatGroove = {
  \drummode {
    \break
    \mark 2

    \repeat percent 4 {
      <<
        \relative { hh8^⚬ 16^⚬ 16^• sn8^⚬ hh16^⚬ 16^• ~ 16 16^⚬ hho8^• sn8^⚬ hh16^⚬ 16^• }
        \\
        \relative { bd4 \mp sn4 r8 bd <hhp sn>4 }
      >>
    }
  }
}

simpleGroove =
#(define-music-function (count) (integer?)
   #{
     \drummode {
       \break
       \mark 3
       \repeat percent #count {
         <<
           \relative { hh8^⚬ 16^⚬ 16^• sn8^⚬ hh16^⚬ 16^• 8 16 16 sn8 hh16 16  }
           \\
           \relative { bd4 \p sn4 r8 bd sn4 }
         >>
       }
       <<
         \relative { hh8 16 16 sn8 hh16 16 8 16 16 sn8^⚬ 16^⚬ 16^• }
         \\
         \relative { bd4 sn4 r8 bd sn4 }
       >>
     }
   #})

\score {
  \layout {
    #(layout-set-staff-size 22)
  }

  \new DrumStaff <<
    \tempo 4 = 120
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \set Score.currentBarNumber = 3
      \intro

      \repeat segno 2 {
        \set Score.currentBarNumber = 11
        \theme
        \jump "al Coda"

        \alternative {
          \volta 1 {
            \repeat volta 2 {
              \set Score.currentBarNumber = 19
              \repeat percent 2 { \openHiHatGroove }
              \bar "||"

              \simpleGroove 3
            }

            \theme

            \set Score.currentBarNumber = 39
            \repeat percent 2 { \openHiHatGroove }
            \bar "||"

            \simpleGroove 7
            \bar "|."
          }
          \volta 2 {
            \section
            \sectionLabel "Coda"
          }
        }
      }
      \break
      \relative {
        \omit \time 16/4
        <<
          \relative { cymr1:32-\< s1-\! s1-\> s1-\! }
          \\
          \relative { s1 }
        >>
      }
      \bar "|."
      \stopStaff
      <<\relative { s1 } >>
    }
  >>
}
