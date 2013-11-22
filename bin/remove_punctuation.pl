#!/usr/bin/perl

binmode(STDIN,":utf8");
binmode(STDOUT,":utf8");

while (<>) {
  $_ = " $_ ";

  s/[\.,:;\?\!"¿\¡=<>\(\)\[\]\{\}%\/]/ /g;

  s/ -- / /g;
  s/ - / /g;

  s/\s+/ /g;
  s/^\s+//;
  s/\s+$//;

  print "$_\n";
}
