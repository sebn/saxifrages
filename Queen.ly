\version "2.25.32"
\language "français"

\header {
  title = "We Are The Champions"
  composer = "Queen"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

intro = {
  \textMark "Intro"
  \compressMMRests {
    \override MultiMeasureRest.expand-limit = #1
    R1*12
  }
  \break
}

themeBreak = {
  \drummode {
    \textMark "Break"
    <bd cymc>4.->^• \f 4.->^• 8.->^• tomfl16^⚬ 8^⚬ <bd cymc>4.->^• 4.->^• tomh16^⚬ 16^• tomml16^⚬ 16^• tomfl8^⚬
    \break
    \repeat percent 3 { <sn tomh>8^⚬^• tomfh16^⚬ 16^• tomfl8^⚬ } <bd cymc>4.->^•
    \break
  }
}

theme = {
  \drummode {
    \textMark "Theme"
    <bd cymc>8->^• cymr^⚬ cymr^⚬ <sn cymr>^•^⚬ cymr^⚬ <bd cymr>^⚬
    <bd cymr>8 cymr cymr <sn cymr> cymr <bd cymr>
    <bd cymr>8 cymr cymr <sn cymr> <bd cymr> <bd cymr>
    <bd cymc>4.-> 4.->
    \break
    <bd cymc>8-> cymr cymr <sn cymr> <bd cymr> <bd cymr>
    <bd cymr>8 cymr cymr <sn cymr> cymr <bd cymr>
    <bd cymc>8-> cymr cymr <sn cymr> <bd cymc>-> <bd cymc>->
    <bd cymc>8-> cymr cymr <sn cymr> <bd cymr> <bd cymr>
    \break
    <bd cymc>8-> cymr cymr <sn cymr> cymr <bd cymr>
    <bd cymr>8 cymr cymr <sn cymr> <bd cymr> <bd cymr>
    <bd cymc>8-> cymr cymr <sn cymr> cymr <bd cymr>
    <bd cymr>8 cymr cymr <sn cymr> cymr <bd cymr>
    \break
    <bd cymc>8-> cymr cymr <sn cymr> cymr <bd cymr>
    \repeat percent 3 {
      <bd cymc>8-> cymr cymr <sn cymr> <bd cymr> <bd cymr>
    }
    <bd hho>8 <bd hhp cymc>4 r4.
    \break
  }
}

ride = {
  \drummode {
    \textMark "Ride"
    cymr4. r r r4 \tuplet 3/2 { cymr16 16 16 } cymr4. r r r4 cb8 cb4. r r r
    \break
    \repeat percent 2 {
      \textMark "Ride"
      cymr4. \p r8
      \textMark "Hi-hat"
      hh8-> \< 8-> 8-> 8-> \!
      hho8 \> ~ 4. \!
      <<
        \relative { s2. }
        \\
        \relative { <hhp cymr>4. r4. }
      >>
      hh8-> \< 8-> \! hho8 \> ~ 4. \!
    }
    \break
    \repeat percent 2 {
      <bd cymr>8 cymr cymr <sn cymr> cymr cymr
    }
    <bd cymr>8 cymr cymr <sn cymr> cymr <bd cymr>
    <bd cymr>8 cymr cymr <sn cymr> <bd cymr> <bd cymr>
    \break
  }
}

end = {
  \drummode {
    \textMark "End"
    \repeat percent 3 {
      <sn tomh>8^⚬^• tomfh16^⚬ 16^• tomfl8^⚬
    }
    <sn tomfh>8^⚬^• tomfl16^⚬ 16^• bd8^⚬
    cymr2.:32
    \bar "|."
  }
}

\score {
  \layout {
    #(layout-set-staff-size 24)
  }

  \new DrumStaff <<
    \time 6/8
    \tempo 4. = 64
    \set DrumStaff.drumStyleTable = #agostini-drums-style

    \drummode {
      \intro
      \themeBreak
      \theme
      \ride
      \themeBreak
      \repeat volta 2 { \theme }
      \end
    }
  >>
}