#!/usr/bin/perl

my @cc = ();
my $outputs = `swaymsg -t get_outputs | jq -r '.[] | .name'`;

for my $output (split ' ', $outputs) {
  print $output
  my $fl="/tmp/$output-lock.png";
  `grim -o "$output" - | convert - -filter Gaussian -blur 0x8 $fl`;
  push @cc, "-i " . $output . ":" . $fl;
}
my $cmd = "swaylock " . join(" ", @cc);
`$cmd`
