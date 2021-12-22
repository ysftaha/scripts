#! /bin/sh
tmp=`mktemp -p .`
$HOME/.local/bin/tree-sitter highlight -H $1                  \
 		| sed -e "s/style/class/g"                \
 		      -e "s/color: #001'/punctuation'/g"  \
 					-e "s/color: #002'/constant'/g"     \
 					-e "s/color: #003'/comment'/g"      \
 					-e "s/color: #004'/embedded'/g"     \
 					-e "s/color: #005'/constructor'/g"  \
 					-e "s/color: #006'/keyword'/g"      \
 					-e "s/color: #007'/number'/g"       \
 					-e "s/color: #008'/string'/g"       \
 					-e "s/color: #009'/function'/g"     \
 					-e "s/color: #0010'/type'/g"        \
 					-e "s/color: #0011'/attribute'/g"   \
 					-e "s/color: #0012'/tag'/g"         \
 					-e "s/color: #0013'/string'/g"      \
 					-e "s/color: #0014'/variable'/g"    \
 					-e "s/color: #0015'/property'/g"    \
 					-e "s/color: #0016'/operator'/g"    \
 					-e "s/color: #0017'/assignment'/g" > $tmp \

sed -n '/^<table>/,/^<\/table>/{p;/^<\/table>/q}' $tmp
rm $tmp
