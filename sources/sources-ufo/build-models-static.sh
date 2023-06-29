# build Playpen fonts per country

set -e

tag="arg"

otfFontsPath="../fonts-countries/fonts-$tag/static/otf"
# ttfFontsPath="../fonts/static/ttf"
# webFontsPath="../fonts/static/web"
# sourcePath="./source-glyphs"
# scripts="./scripts"

rm -rf $otfFontsPath  # $ttfFontsPath $webFontsPath
mkdir -p $otfFontsPath # $ttfFontsPath $webFontsPath

echo "
==================================
 Generating STATIC **$tag** fonts
==================================
 $(date "+ 📅 DATE: %Y-%m-%d%n  🕒 TIME: %H:%M:%S")"
echo

# Build OTF fonts
fontmake -m ./Playpen-$tag.designspace -i -o otf \
            --output-dir $otfFontsPath \
            --expand-features-to-instances \
            --no-check-compatibility

# # Build TTF fonts
# fontmake -g ./Playpen_MM.glyphs -i -o ttf --output-dir $ttfFontsPath \
# 			--filter DecomposeTransformedComponentsFilter \
# 			--flatten-components

# echo "
# ======================
#  Post processing OTFs 
# ======================
# "
# otfs=$(ls $otfFontsPath/*.otf)
# for otf in $otfs
# do
# 	echo $otf
# 	python $scripts/fix-usWeightClass-otf.py $otf
# 	psautohint --no-zones-stems -a $otf
# done

# echo "
# ======================
#  Post processing TTFs 
# ======================
# "
# ttfs=$(ls $ttfFontsPath/*.ttf)
# for ttf in $ttfs
# do
# 	ttfautohint $ttf "$ttf.hint"
# 	mv "$ttf.hint" $ttf
# 	gftools fix-hinting $ttf;
# 	mv "$ttf.fix" $ttf;
# 	echo $ttf
# 	sfnt2woff $ttf
# 	woff2_compress $ttf
# 	lenght=${#ttf}
# 	echo "Compressing to .woff:"
# 	mv ${ttf:0:$lenght-4}.woff $webFontsPath
# 	mv ${ttf:0:$lenght-4}.woff2 $webFontsPath
# done

# Clean up
rm -rf ./master_ufo/ ./instance_ufo/