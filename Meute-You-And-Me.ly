\version "2.25.32"
\language "français"

\header {
  title = "You & Me"
  composer = "Meute"
  arranger = "Arr. Saxifrages"
  tagline = #f
}

swing = {
  \textMark "Swing"
  r8 \f <mib solb reb'>-. <mib solb mib'>16-. <mib solb fa'> r <mib solb reb'> r2
  <reb fa sib>8-. <reb fa lab>-. r16 <reb fa sib> r <reb fa lab> r4 <reb fa sib>8-. <reb fa lab>-.
  r8 <sib fa' sib>-. r16 16 r16 16 r2
  r8 <do fa la>-. r16 16 r16 16 r4 <do fa sib>8-. <do fa do'>-.
  \break
  r8 <solb' sib reb>8-. 16-. 16 r16 16 r2
  <reb fa sib>8-. <reb fa lab>-. r16 <reb fa sib> r <reb fa lab> r4 <reb fa sib>8-. <reb fa lab>-.
  r8 <fa la fa'>-> r8 8-> r8 8-> r8 <fa la mib' fa>->
  r8 <fa la fa'>-> r8 8-> r8 8-> reb' <solb, mib'>->
  \break
}

\score {
  \layout {
    #(layout-set-staff-size 24)
  }

  \new Staff \relative {
    \tempo 4 = 78
    \key sib \minor

    \textMark "Intro"
    \repeat percent 4 {
      <mib' sib' reb solb>8-> \mp 8 8 8-> 8 8 8-> 8
    }
    \bar "||"
    
    \break
    \repeat percent 2 {
      \repeat percent 8 <mib sib' reb solb>8->
      \repeat percent 8 <reb lab' do fa>8->
      \repeat percent 8 <solb sib reb fa>8->
      \repeat percent 8 <fa do' mib la>8->
      \break
      \repeat percent 8 <solb reb' fa sib>8->
      \repeat percent 8 <fa sib reb lab'>8->
      \repeat percent 8 <do la' mib' la>8->
      \repeat percent 8 <fa la mib' la>8->
      \break
    }
    \bar "||"
    \break
    \repeat percent 8 <mib sib' reb solb>8-> \mf
    \repeat percent 8 <reb lab' do fa>8->
    \repeat percent 8 <fa sib reb fa>8->
    \repeat percent 8 <fa do' mib la>8->
    \break
    \repeat percent 8 <solb reb' fa sib>8->
    \repeat percent 8 <fa sib reb lab'>8->
    \repeat percent 8 <do la' mib' la>8->
    \repeat percent 8 <fa la mib' la>8->
    \break

    \repeat percent 2 { \swing }

    \pageBreak

    \textMark "Straight"
    \repeat percent 2 {
      \repeat percent 8 <mib sib' reb solb>8-> \mp
      \repeat percent 8 <reb lab' do fa>8->
      \repeat percent 8 <fa sib reb lab'>8->
      \repeat percent 8 <fa do' mib la>8->
      \break
      \repeat percent 8 <solb reb' fa sib>8->
      \repeat percent 8 <fa sib reb lab'>8->
      \repeat percent 8 <do la' mib' la>8->
      \repeat percent 8 <fa la mib' la>8->
      \break
    }
    \break

    \swing

    \compressMMRests {
      \override MultiMeasureRest.expand-limit = #1
      R1*8
    }

    \break
    <mib fa mib'>8-. \mf 8-. r16 16 r16 16 r2
    <reb fa reb'>8-. 8-. r16 16 r16 16 r2
    <sib fa' sib>8-. 8-. r16 16 r16 16 r2
    <fa' fa'>8-. 8-. r16 16 r16 16 r2
    \break
    <solb solb'>8-. 8-. r16 16 r16 16 r2
    <reb fa reb'>8-. 8-. r16 16 r16 16 r2
    r8 <fa la la'>-> r8 8-> r8 8-> r8 8->
    r8 <fa la la'>-> r8 8-> r8 8-> r4
    \break

    \compressMMRests {
      \override MultiMeasureRest.expand-limit = #1
      R1*9
    }
    \bar "|."

  }
}