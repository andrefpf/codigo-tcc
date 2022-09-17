tex_modified() {
    (git status --porcelain --untracked-files=no) | (grep .tex)
}

if [ "$(tex_modified)" ]
then
    ./scripts/tex2pdf.sh
    git add dissertation/example.pdf
fi