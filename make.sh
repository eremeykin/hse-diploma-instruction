latex -src -interaction=nonstopmode instruction.tex
pdflatex -synctex=1 -interaction=nonstopmode  instruction.tex
makeglossaries instruction
bibtex ./pdf/instruction.aux
pdflatex -synctex=1 -interaction=nonstopmode instruction.tex
rm ./*.acn ./*.acr ./*.alg ./*.aux ./*.dvi ./*.glg ./*.glo ./*.gls ./*.ist ./*.log ./*.out ./*.toc
# rm ./pdf/*.acn ./pdf/*.acr ./pdf/*.alg ./pdf/*.aux ./pdf/*.dvi ./pdf/*.glg ./pdf/*.glo ./pdf/*.gls ./pdf/*.ist ./pdf/*.log ./pdf/*.out ./pdf/*.toc ./pdf/*.bbl ./pdf/*.toc ./pdf/*.blg ./pdf/*.toc ./pdf/*.synctex.gz
