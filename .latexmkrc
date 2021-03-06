#!/usr/bin/env perl

$pdflatex = 'lualatex %O %S -halt-on-error -interaction=nonstopmode -file-line-error';
$pdf_mode = 1;

$bibtex    = 'upbibtex %O %B';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$makeindex = 'upmendex %O -o %D %S';
