\version "2.25.32"
\language "français"

\header {
  title = "Kyle n' Paul"
  composer = "Lucky Chops"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

% GROOVES

grooveB = \drummode {
  <<
    \relative { s1 }
    \\
    \relative { bd8 bd <sn sn> <sn sn> bd bd sn4 }
  >>
}

grooveCCC = \drummode {
  <<
    \relative { s1 }
    \\
    \relative { <bd cymr>4 <bd cymr> <sn cymr> cymr }
  >>
}

% SECTIONS

intro = \drummode {
  \textMark "Intro"
  \compressMMRests {
    \override MultiMeasureRest.expand-limit = #1
    R1*14
  }
  <sn sn>4-> sn8 -\< 8 8 8 8 8 8 8 8 8 8 8 -\! cymc4
  \break
}

theme = \drummode {
  \textMark "Theme"
  \repeat percent 4 {
    \repeat percent 3 {
      <<
        \relative { hh4 4 4 4 }
        \\
        \relative { bd4 sn bd8 bd sn4 }
      >>
    }
    <<
      \relative { hh4 4 4 4 }
      \\
      \relative { bd4 sn bd8 bd sn bd }
    >>
    \break
  }
  \break
}

shortBreakSection = \drummode {
  \textMark "Break"
  \repeat percent 3 { \grooveB }
  <<
    \relative { s1 }
    \\
    \relative { bd8 bd <sn sn> <sn sn> bd bd <sn cymc>4 }
  >>
  \break
}

longBreakSection = \drummode {
  \textMark "Break"
  \repeat percent 4 {
    \grooveB
  }
  \break
  \repeat percent 3 {
    <<
      \relative { s1 }
      \\
      \relative { bd8 bd \textMark "Crash" <sn cymc> sn bd bd \textMark "Ride" <sn cymr>4 }
    >>
  }
  <<
    \relative { s1 }
    \\
    \relative { bd8 bd \textMark "Crash" <sn cymc>4 <bd cymc> <sn cymc> }
  >>
  \break
}

fastCrashSection = \drummode {
  \textMark "Crash"
  \repeat percent 4 {
    \repeat percent 4 {
      <<
        \relative { s1 }
        \\
        \relative { <bd cymc>4 <sn cymc> <bd cymc> <sn cymc> }
      >>
    }
  }
  \break
}

slowCrashGroove = \drummode {
  \textMark "Crash"
  \repeat percent 4 {
    \repeat percent 4 {
      <<
        \relative { s1 }
        \\
        \relative { <bd cymc>4 bd <sn cymc>2 }
      >>
    }
  }
  \break
}

rideSection = \drummode {
  \textMark "Ride"
  \repeat percent 3 {
    \repeat percent 4 { \grooveCCC }
  }
  \repeat percent 3 { \grooveCCC }
  <<
    \relative { s1 }
    \\
    \relative { <bd cymr>4 sn8-\< 8 8 8 8 8-\! }
  >>
  \break
}

finalBreakSection = \drummode {
  \repeat percent 4 { \grooveB }
  \break
  \repeat percent 3 {
    <<
      \relative { s1 }
      \\
      \relative { bd8 bd \textMark "Crash" <sn cymc> sn bd bd \textMark "Crash" <sn cymc>4 }
    >>
  }
  <<
    \relative { \textMark "Crash stop" s1 }
    \\
    \relative { <bd cymc>8 8 r4 <sn cymc>8 8 r4 }
  >>
  \bar "|."
}

% SCORE

\score {
  \new DrumStaff <<
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \intro
      \theme
      \shortBreakSection
      \theme
      \longBreakSection
      \fastCrashSection
      \longBreakSection
      \slowCrashGroove
      \rideSection
      \theme
      \finalBreakSection
    }
  >>
}