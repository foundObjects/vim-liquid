" Liquid
au BufNewFile,BufRead *.liquid					set ft=liquid

au BufNewFile,BufRead */_layouts/*.html,*/_includes/*.html	set ft=liquid
au BufNewFile,BufRead *.{html,htm,xml,textile}
      \ if getline(1) == '---' | set ft=liquid | endif
au BufNewFile,BufRead *.css
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'css' |
      \   set ft=liquid |
      \ endif
au BufNewFile,BufRead *.js
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'javascript' |
      \   set ft=liquid |
      \ endif
au BufNewFile,BufRead *.json,site.webmanifest
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'json' |
      \   set ft=liquid |
      \ endif
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn}
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'markdown' |
      \   set ft=liquid |
      \ endif
au BufNewFile,BufRead *.scss
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'scss' |
      \   set ft=liquid |
      \ endif

" Set subtype for Shopify alternate templates
au BufNewFile,BufRead */templates/**.liquid,*/layout/**.liquid,*/snippets/**.liquid
      \ let b:liquid_subtype = 'html' |
      \ set ft=liquid |

" attempt to catch matches from other filetype plugins
au BufNewFile,BufRead *
\ if getline(1) == '---' |
\		if &ft != 'liquid' |
"\			echo "&ft = " . &ft |
\			if ! exists('b:liquid_subtype') |
\				let b:liquid_subtype = &ft |
\			endif |
\			set ft=liquid |
\		endif |
\ endif

