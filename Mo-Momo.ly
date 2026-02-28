\version "2.25.32"
\language "français"

\header {
  title = "Mo' Momo!"
  composer = "Lucky Chops"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

introRoll = {
  \drummode {
    <<
      \relative { sn8^⚬ 8^• 8 8 8 8 8 8 <sn sn hhp>4-> hhp hhp \tuplet 3/2 { <hhp sn>8 sn sn } }
      \\
      \relative { s4 \p \< s2 s4 s1 \! \f }
    >>
  }
}

introCrashes = {
  \drummode {
    \repeat percent 2 {
      <<
        \relative { r8 <sn cymc>8-> s4 r8 <sn cymc>8-> s4 }
        \\
        \relative { bd8 8 r4 bd 8 8 r4 }
      >>
    }
  }
}

crashAndSwingTheme = {
  \drummode {
    <<
      \relative { cymc4-> sn8 8 r4 sn }
      \\
      \relative { bd4 4 4 4 }
    >>
  }
}

swingTheme = {
  \drummode {
    <<
      \relative { r4 sn8 8 r4 sn }
      \\
      \relative { bd4 4 4 4 }
    >>
  }
}

straightBreakIntro = {
  \drummode {
    <<
      \relative { sn8^⚬ 8^• 8 8 8 8 8 8 }
      \\
      \relative { bd4 4 4 4 }
    >>
  }
}

straightBreak = {
  \drummode {
    <<
      \relative {
        <sn cymc>8 sn <sn cymc>8 sn
          \override TupletBracket.bracket-visibility = ##t
          \tuplet 3/2 4 { <sn cymc>8 sn8^• 8^⚬ 8^⚬ 8^• 8^• }
      }
      \\
      \relative { bd4 4 4 4 }
    >>
  }
}

straightTheme = {
  \drummode {
    <<
      \relative { bd8 hh-> sn hh-> bd hh-> sn hh-> }
      \\
      \relative { s1 }
    >>
  }
}

straightThemeBreakToSyncopations = {
  \drummode {
    <<
      \relative { bd8 hh-> sn hh-> <bd sn> hh-> sn hh-> }
      \\
      \relative { s1 }
    >>
  }
}
straightSyncopationsFirstHalf = {
  \drummode {
    <<
      \relative { sn4 cymc r r8 <sn cymc> }
      \\
      \relative { <bd hhp>4 hhp <bd hhp>8 bd hhp bd }
    >>
  }
}

straightSyncopations = {
  \straightSyncopationsFirstHalf
  \drummode {
    <<
      \relative { s1 }
      \\
      \relative { hhp4 <bd hhp>8 bd hhp bd hhp4 }
    >>
  }
}

threeBeats = {
  \drummode {
    <<
      \relative { s1 }
      \\
      \relative { <bd hhp>4 4 4 hhp }
    >>
  }
}

hihatBeats = {
  \drummode {
    \relative { hhp4 4 4 4 }
  }
}

heavy = {
  \drummode {
    <<
      \relative { cymc4 4 4-> 4 4 4 4-> 4 }
      \\
      \relative { r2 \ff sn4 r \tuplet 3/2 { bd4 4 4 } sn4 r }
    >>
  }
}

longRollSnare = {
  \drummode {
    \relative { sn16^⚬ 16 16^• 16 16 16 16 16 16 16 16 16 16 16 16 16 }
  }
}

longRollStart = {
  \drummode {
    <<
      \longRollSnare
      \\
      \relative { s4 \pp \< s2 s4 \! }
    >>
  }
}

longRollMiddle = {
  \drummode {
    <<
      \longRollSnare
      \\
      \relative { s4 \mf \< s2 s4 \! }
    >>
  }
}

straightHeavy = {
  \drummode {
    <<
      \relative { cymc4 4 4-> 4 }
      \\
      \relative { bd8\ff 8 4 4 r }
    >>
  }
}

\score {
  \layout {
    #(layout-set-staff-size 24)
  }

  \new DrumStaff <<
    \tempo 4 = 140
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \textMark "Straight"
      \introRoll
      \textMark "Swing"
      \introCrashes
      \bar "|."
      \break

      \textMark "Swing"
      \repeat percent 5 {
        \crashAndSwingTheme
        \repeat percent 3 \swingTheme
      }
      \break

      \crashAndSwingTheme
      \repeat percent 3 \swingTheme
      \textMark "Straight"
      \straightBreakIntro
      \straightBreak
      \bar "|."
      \break

      \textMark "Straight"
      \repeat percent 7 \straightTheme
      \straightThemeBreakToSyncopations
      \bar "|."
      \break

      \repeat percent 2 \straightSyncopations
      \repeat unfold 2 \hihatBeats
      \bar "|."
      \break

      \textMark "Swing"
      \repeat percent 5 {
        \swingTheme
        \repeat percent 3 \swingTheme
      }
      \break

      \repeat percent 3 {
        \crashAndSwingTheme
        \repeat percent 3 { \swingTheme }
      }
      \break

      \repeat percent 3 { \swingTheme }
      \textMark "Straight"
      \straightBreak
      \bar "|."
      \break

      \textMark "Straight"
      \repeat percent 7 { \straightTheme }
      \straightThemeBreakToSyncopations
      \bar "|."
      \break

      \repeat percent 2 { \straightSyncopations }
      \straightBreakIntro
      \threeBeats
      \bar "|."
      \break

      \repeat percent 8 { \heavy }
      \bar "|."
      \break

      \textMark "Crescendo"
      \repeat percent 5 {
        \repeat percent 4 { \longRollStart }
      }
      \repeat percent 3 { \longRollMiddle }
      \break

      \hihatBeats
      \bar "|."
      \repeat percent 8 { \straightHeavy }
      \break

      \hihatBeats
      \bar "|."
      \repeat percent 8 { \straightTheme }
      \bar "|."
      \break

      \repeat percent 4 { \straightSyncopations }
      \straightSyncopationsFirstHalf
      \threeBeats
      \compressMMRests {
        \override MultiMeasureRest.expand-limit = #1
        R1*5
      }
      \bar "|."
    }
  >>
}
