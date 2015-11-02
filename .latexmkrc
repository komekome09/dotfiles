#!/usr/bin/env perl
$latex                          = 'platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$dvipdf                         = 'dvipdfmx -f ptex-ipaex.map %S';
$bibtex                         = 'pbibtex -kanji=utf8 %B';
$pdf_mode                       = 3; # generates pdf via dvipdfmx

# chase the update PDF automatically
$pvc_view_file_via_temporary    = 0;
# Use skim as a previewer
$pdf_previewer                  = "open";
