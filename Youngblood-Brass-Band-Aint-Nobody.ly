\version "2.25.32"
\language "français"

\header {
  title = "Ain't Nobody"
  composer = "Youngblood Brass Band"
  arranger = "(originally recorded by Chaka Kahn)"
  opus = "Arr. Saxifrages"
  tagline = #f
}

\score {
  \layout {
    #(layout-set-staff-size 24)
  }

  \new DrumStaff <<
    \tempo 4 = 232
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \repeat percent 35 {
        <<
          \relative { <ss cb>4 4 <ss cb>8 cb cb <ss cb> r <ss cb> r <ss cb> r <ss cb> cb cb }
          \\
          \relative { \repeat unfold 4 { bd4 hhp8 bd } }
        >>
      }
      <<
        \relative { <ss cb>4 4 <ss cb>8 cb cb <ss cb> r <ss cb> r <ss cb> r tomh^• tomh^• tomfl^⚬ }
        \\
        \relative { \repeat unfold 3 { bd4 hhp8 bd } bd2 }
      >>
      r1
    }
  >>
}
