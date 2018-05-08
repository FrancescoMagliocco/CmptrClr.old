hi clear Normal
set bg&

hi clear
if exists("syntax_on")
    syn reset
endif

let colors_colors = "cmptrclr"

hi  normal              guifg=#ffffff   guibg=#000000   cterm=none

hi  comment             guifg=#505050   guibg=NONE      cterm=none
hi  commentStart        guifg=#404040   guibg=NONE      cterm=none
hi  command             guifg=#005ab3   guibg=NONE      cterm=none

hi  statement           guifg=#0000e6   guibg=NONE      cterm=none
hi  type                guifg=#ff8000   guibg=NONE      cterm=none
hi  identifier          guifg=#00e600   guibg=NONE      cterm=none
hi  conditional         guifg=#7600eb   guibg=NONE      cterm=none
hi  constant            guifg=#e6e600   guibg=NONE      cterm=none
hi  preProc             guifg=#e600e6   guibg=NONE      cterm=none
hi  special             guifg=#cc0000   guibg=NONE      cterm=none
hi  format              guifg=#b30000   guibg=NONE      cterm=none
hi  variable            guifg=#00ebeb   guibg=NONE      cterm=none
hi  parameter           guifg=#b300b3   guibg=NONE      cterm=none
hi  operator            guifg=#7300e6   guibg=NONE      cterm=none
hi  number              guifg=#ff0000   guibg=NONE      cterm=none
hi  character           guifg=#e60000   guibg=NONE      cterm=none
hi  define              guifg=#8000ff   guibg=NONE      cterm=none
hi  method              guifg=#0080ff   guibg=NONE      cterm=none
hi  attribute           guifg=#0073e6   guibg=NONE      cterm=none
hi  functionName        guifg=#006734   guibg=NONE      cterm=none

" vim buffers
hi  cursorLine          guifg=NONE      guibg=#151515   cterm=none
hi! link cursorColumn   cursorLine
hi  colorColumn         guifg=NONE      guibg=#1e1e1e   cterm=none

" Based off of:
" https://github.com/dylnmc/lyne-vim/blob/master/plugin/lyne.vim#L19
fu! GetColor(group, term, fgbg)
    if (index(['cterm', 'gui'], a:term) >= 0
                \ && index(['fg', 'bg', ''], a:fgbg) >= 0)
        retu synIDattr(synIDtrans(hlID(a:group)), a:fgbg, a:term)
    en
endf

fu! IsColor(color)
    retu a:color =~ '^(#[0-9A-f]{6}|\d{1,3}|Black|White|NONE|((Dark|Light)?(Blue|Green|Cyan|Red|Magenta|Yellow|Gray|Grey)))$'
endf

fu! IsIface(iface)
    retu a:iface =~ '/^(gui|cterm)$/i'
endf

""
" TODO: Rewrite the usage because this is way out of context now..
" @usage {} [] [] [] []
" {hiGroup} will have its forground color set to [fgHiGroup], its background
" background color set to [bgHiGroup] and its attribute set [attrHiGroup].
" [termStyle] will determine wheather or not to set/get the values for 'gui',
" or 'cterm'.
" @default fgHiGroup=NONE
" @default bgHiGroup=NONE
" @default attrHiGroup=none
" @default termStyle=gui
fu! SetColor(group, ...)
    let l:iface
    let l:fg = [2]
    let l:bg = [2]
    let l:tStyle = [2]
    let l:allgrps = [l:fg, l:bg, l:attr]
    let l:grplst = ["'{fgHiGroup}'", "'{bgHiGroup}'", "'{attrHiGroup}'"]
    let l:ntogrp = ['fg', 'bg', '']
   
    for i in range(0, len(l:alvars) - 1)
        let l:ai = get(a:, i + 1, (i < 2 ? 'NONE' : 'none'))
        if type(l:ai) == v:t_list
            let l:anlen = len(l:ai)
            if l:anlen
                if l:anlen >= 2
                    if l:anlen > 2
                        echom 'More than 2 arguments were provided for '
                                    \ . l:grplst[i]
                                    \ . '.  Ignoring the rest...'
                    en

                    if IsIface(l:ai[1])
                        l:allgrps[i][1] = tolower(l:ai[1])
                    el
                        echom "Expected 'gui' or 'cterm'... Got '"
                                    \ . l:ai[1] . "'."
                        echom "Using 'gui' by default"
                        l:allgrps[i][1] = 'gui'
                    en

                    l:allgrps[i][0] = IsColor(l:an[0])
                                \ ? l:an[0]
                                \ : GetColor(
                                        \ l:an[0],
                                        \ l:allgrps[i][1],
                                        \ l:ntogrp[i])
                en
            el
                echom 'A list was provided, but it was empty...'
            en
        en
        if type(get(a:, i + 1, (i < 2 ? 'NONE' : 'none'))) == v:t_list
            let l:anlen = len(a:(i + 1))
        en
    endfo
endf

""    if type(get(a:, 1, 'NONE') == v:t_list)
"        let l:a1len = len(a:1)
"        if l:a1len
"           if l:alen >= 2
"               if l:alen > 2
"                   echom 'You provided more than 2 arguemnts for parameter '
"                               \ . "'{fgHiGroup}'.  Ignoring the rest"
"               en
               
"               if IsIface(a:1[1])
"                   let l:iface = tolower(a:1[1])
"               el
"                   echom "Expected 'gui' or 'cterm'..  Got '" . a:1[1] . "'..."
"                   echom "Using 'gui' as default!"
"                   let l:iface = 'gui'
"               en

"               let l:fg = IsColor(a:1[0])
"                           \ ? a:1[0]
"                           \ : GetColor(a:1[0], l:iface, 'fg')
"           en
"        el
"            echom 'You provided a list, but it was empty...'
"        en
"    en

    " This is all junk.  Ignore below here.-----------------------------------
    " gui or cterm.  (Default: gui)
"    let l:iface = get(a:, 5, 'gui')
    " forground
"    let l:fg = IsColor(get(a:, 1, 'NONE')) ? a:1 : GetColor(a:1, l:iface, 'fg')
    " background
"    let l:bg = IsColor(get(a:, 2, 'NONE')) ? a:2 : GetColor(a:2, l:iface, 'bg')

"    let l:fg = (a:fg =~ '#' ? a:fg : GetColor(a:fg, 'gui', 'fg'))
"    let l:bf = (a:bg =~ '#' ? a:bg : GetColor(a:bg, 'gui', 'fg'))
"endf

"fu! SetColorOLD(group, ...)
    " gui, cterm or colorGroup
"    let l:a1 = (index([0, 1], get(a:, 1, 0)) == -1
"                \ ? a:1
"                \ : ['gui', 'cterm'][a:1])
"    echom l:a1
"    if l:a1 == a:1
        " gui or cterm
"        let l:a5 = get(a:, 5, 'gui')
"        echom l:a5
        " fg
"        let l:a2 = (get(a:, 2, 0) ? GetColor(l:a1, l:a5, 'fg') : 'NONE')
"        echom l:a2
        " bg
"        let l:a3 = (get(a:, 3, 0) ? GetColor(l:a1, l:a5, 'bg') : 'NONE')
"        echom l:a3
        " term
"        let l:a4 = (get(a:, 4, 0) ? GetColor(l:a1, l:a5, '') : 'none')
"        echom l:a4
"        exec 'hi ' . a:group . ' '
"                    \ . l:a5 . 'fg=' . l:a2 . ' '
"                    \ . l:a5 . 'bg=' . l:a3 . ' '
"                    \ . l:a5 . '=' . l:a4
"    en
"endf

"cal SetColor('lineNr', 'number', 1, 0, 0, 'gui')
" vim
hi! link vimCommand     command
hi! link vimFBVar       vimVar
hi! link vimFunc        functionName
hi! link vimFuncName    vimFunc
hi! link vimFunction    vimFunc
hi! link vimHighlight   vimCommand
hi! link vimLineComment comment
hi! link vimNumber      number

" I linked 'vimNotFunc' to 'conditional' because when I first discovered
" 'vimNotFunc', it was on an 'if'.
hi! link vimNotFunc     conditional
hi! link vimOper        operator
hi! link vimOperParen   parameter
hi! link vimSynType     type
hi! link vimUserFunc    vimFunc
hi! link vimVar         variable
hi  conceal             guifg=#1f1f1f   guibg=NONE      cterm=none
hi  vimFuncVar          guifg=#00eb76   guibg=NONE      cterm=none
hi  lineNr              guifg=#ff0000   guibg=#1e1e1e   cterm=none
