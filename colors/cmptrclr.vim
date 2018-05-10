hi clear Normal
set bg&

hi clear
if exists("syntax_on")
    syn reset
endif

let colors_colors = "cmptrclr"

" Based off of:
" https://github.com/dylnmc/lyne-vim/blob/master/plugin/lyne.vim#L19
" NOTE: Possibly improve the checks here.
" TODO: Refactor function name, because 'GetColor' does not only get the color
"   of the given hilightGroup.  It get's the attributes.
fu! GetColor(group, term, fgbg)
    if (index(['cterm', 'gui'], a:term) >= 0
                \ && index(['fg', 'bg', ''], a:fgbg) >= 0)
        retu synIDattr(synIDtrans(hlID(a:group)), a:fgbg, a:term)
    en
endf

" FIXME: Wont match #[0-9A-f]{6} but will everything else.
fu! IsColor(color)
    let l:b = a:color =~ '^\(#\[0-9A-f\]\{6\}\|\d\{1,3\}\|Black\|White\|NONE\|\(\(Dark\|Light\)\?\(Blue\|Green\|Cyan\|Red\|Magenta\|Yellow\|Gray\|Grey\)\)\)$'
    retu l:b
endf

fu! IsIface(iface)
    retu a:iface =~ '^\(gui\|cterm\)$' 
endf

" TODO: For the attributes, you're able to use multiple ones at once, for
"   example: 'cterm=bold,underline' this won't match if more than one attribute
"   is given.  Need to eventually implement support in for multiple attributes
"   at once.
fu! IsAttr(attr)
    retu a:attr =~ '^\(bold\|underline\|undercurl\|strikethrough\|reverse\|inverse\|italic\|standout\|nocomine\|none\)$'
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
    let l:allgrps = []
    let l:grplst = ["'{fgHiGroup}'", "'{bgHiGroup}'", "'{attrHiGroup}'"]
    let l:ntogrp = ['fg', 'bg', '']

    for l:i in range(0, 2)
        let l:ai = get(a:, l:i + 1, (l:i < 2 ? 'NONE' : 'none'))
        if type(l:ai) == v:t_list
            let l:anlen = len(l:ai)
            if l:anlen
                " TODO: Find a different approach.  I don't like all these
                "   neseted statements.
                if l:anlen >= 2
                    " TODO: Espeically this...
                    if l:anlen > 2
                        echom 'More than 2 arguments were provided for '
                                    \ . l:grplst[l:i]
                                    \ . '.  Ignoring the rest...'
                    en

                    if IsIface(l:ai[1])
                        cal add(l:allgrps, [tolower(l:ai[1])])
                    el
                        echom "Expected 'gui' or 'cterm'... Got '"
                                    \ . l:ai[1] . "'."
                        echom "Using 'gui' by default"
                        cal add(l:allgrps, ['gui'])
                    en

                    " FIXME: The way this is formatted is driving my OCD
                    "   fucking nuts...
                    cal add(l:allgrps[l:i], (
                                \ (l:i < 2
                                \       ? IsColor(l:ai[0])
                                \       : IsAttr(l:ai[0]))
                                \   ? l:ai[0]
                                \   : GetColor(
                                \       l:ai[0],
                                \       l:allgrps[l:i][0],
                                \       l:ntogrp[l:i])))
                en
            el
                echom 'A list was provided, but it was empty...'
            en
        en
    endfo
endf

hi  normal              guifg=#ffffff   guibg=#000000   cterm=none

hi  attribute           guifg=#0073e6   guibg=NONE      cterm=none

" FIXME: I do not like this color for this group.
hi  boolean             guifg=#800055   guibg=NONE      cterm=none
hi  braces              guifg=#5000ff   guibg=NONE      cterm=bold
hi  character           guifg=#e60000   guibg=NONE      cterm=none
hi  comment             guifg=#505050   guibg=NONE      cterm=none
hi  commentStart        guifg=#404040   guibg=NONE      cterm=none
hi  command             guifg=#005ab3   guibg=NONE      cterm=none
hi  conditional         guifg=#7600eb   guibg=NONE      cterm=none
hi  constant            guifg=#e6e600   guibg=NONE      cterm=none
hi  define              guifg=#8000ff   guibg=NONE      cterm=none

hi  emphasis            guifg=#ff00ff   guibg=NONE      cterm=none
hi  enumName            guifg=#4c9a00   guibg=NONE      cterm=none
hi  error               guifg=#b30000   guibg=NONE      cterm=none
hi  escape              guifg=#800000   guibg=NONE      cterm=none
hi  float               guifg=#ff2500   guibg=NONE      cterm=none
hi  format              guifg=#b30000   guibg=NONE      cterm=underline
hi  functionName        guifg=#006734   guibg=NONE      cterm=none
hi  identifier          guifg=#00aa18   guibg=NONE      cterm=none
hi  include             guifg=#e700a0   guibg=NONE      cterm=none
hi  member              guifg=#ffbf00   guibg=NONE      cterm=none
hi  method              guifg=#0080ff   guibg=NONE      cterm=none

" NOTE: Might actually make this red beacuse this color does not stand out so
"   well.
hi  noise               guifg=#b50000   guibg=NONE      cterm=bold
hi  number              guifg=#ff0000   guibg=NONE      cterm=none

" NOTE: This is hard to see in some situtations.
hi  operator            guifg=#5000ff   guibg=NONE      cterm=none
" FIXME: I don't like this at all..
"hi  operator            guifg=#b400b3   guibg=NONE      cterm=none
hi  option              guifg=#9c1add   guibg=NONE      cterm=none
hi  parameter           guifg=#b300b3   guibg=NONE      cterm=none

" NOTE: Not to sure how I feel about this color...
hi  preCondit           guifg=#004566   guibg=NONE      cterm=none
hi  preProc             guifg=#e600e6   guibg=NONE      cterm=none
hi  reference           guifg=#0055ee   guibg=NONE      cterm=none

" NOTE: Not sure if I like this..
hi  repeat              guifg=#4e00aa   guibg=NONE      cterm=none
hi  special             guifg=#cc0000   guibg=NONE      cterm=none
hi  statement           guifg=#0000e6   guibg=NONE      cterm=none
hi  storageClass        guifg=#ff5f5f   guibg=NONE      cterm=none

hi  string              guifg=#b500b5   guibg=NONE      cterm=none
hi  structure           guifg=#ff9000   guibg=NONE      cterm=none

hi  title               guifg=#00ff00   guibg=NONE      cterm=none
hi  type                guifg=#ff5000   guibg=NONE      cterm=none
hi  underlined          guifg=#0055ee   guibg=NONE      cterm=underline
hi  url                 guifg=#0055ee   guibg=NONE      cterm=underline
hi  variable            guifg=#00ebeb   guibg=NONE      cterm=none
hi  warning             guifg=#b35a00   guibg=NONE      cterm=none

hi! link function       functionName
hi! link note           title
hi! link errorMsg       error
hi! link warningMsg     warning
hi! link exception      warning
hi! link quote          noise
hi! link dot            noise

" asciidoc
" TODO: Make sure doesn't clash with "comment"
hi  asciidocList        guifg=#606060   guibg=NONE      cterm=none
hi  asciidocQuotedBold  guifg=#ffffff   guibg=NONE      cterm=none

hi! link asciidocAttributeEntry     attribute
hi! link asciidocAttributeList      asciidocAttributeEntry
hi! link asciidocBackslash          escape
hi! link asciidocEntryRef           reference

" NOTE: If using "special" clashes with the use of "special" anywhere else for
"   asciidoc, think about using "identifier" or creating some type of delimiter
"   group.
hi! link asciiidocListBullet        special

" NOTE: Even though this is more of a "reference" than a "macro", when you
"   about it, it actually is more like a "macro" as it allows you to not have
"   to type out the whole path of a link.  Also, the group
"   "asciidocMacroAttributes" is more of a "reference" because it is
"   linking towards something, but it's not actually a link its self.
" TODO: Reword this.
hi! link asciidocMacro              preProc
hi! link asciidocMacroAttributes    reference
hi! link asciidocOneLineTitle       title

" NOTE: Orignally linked to "identifier".  Using "preProc" here doens't make
"   sense as I have mostly used "preProc" for macros and alike.  This is more
"   of a code type highlight group.
hi! link asciidocQuotedMonospaced2  preProc

" NOTE: Originally was linked to highlight group "type"
hi! link asciidocQuotedEmphasized           emphasis
hi! link asciidocQuotedEmphasized2          asciidocQuotedEmphasized
hi! link asciidocQuotedUnconstrainedBold    asciidocQuotedBold
hi! link asciidocTableBlock                 asciidocList
hi! link asciidocTableDelimiter             special

" NOTE: I have mixed feelings about this one..
hi! link asciidocTablePrefix        preProc

" C
hi! link cAnsiFunction      functionName
hi! link cAnsiName          preProc
hi! link cBoolean           boolean
hi! link cCommentStart      commentStart
hi! link cComment           comment
hi! link cCommentL          cComment
hi! link cConditional       conditional

" NOTE: 'NULL' is in this group
hi! link cConstant          constant
hi! link cCppString         string
hi! link cCustomFunc        cAnsiFunction
hi! link cDefine            define
hi! link cFloat             float
hi! link cFormat            format
hi! link cInclude           include

" TODO: Use a different color for this
hi! link cIncluded          string
hi! link cNumber            number
hi! link cPreCondit         preCondit
hi! link cPreContiMatch     cPreCondit
hi! link cRepeat            repeat
hi! link cStatement         statement
hi! link cString            string
hi! link cStructure         structure
hi! link cType              type

" Git
hi  gitGutterAddDefault     guifg=#00ff00   guibg=#101010   cterm=none
hi  gitGutterChangeDefault  guifg=#ffff00   guibg=#101010   cterm=none
hi  gitGutterDeleteDefault  guifg=#ff0000   guibg=#101010   cterm=none

hi! link gitGutterAddInvisible      gitGutterAddDefault
hi! link gitGutterChangeInvisible   gitGutterChangeDefault
hi! link gitGutterDeleteInvisible   gitGutterDeleteDefault

" json
hi! link jsonBraces         braces

" NOTE: The usage is more like an identifer, so I'm using identifier rather
"   than statement.
hi! link jsonKeyword        identifier
hi! link jsonKeywordMatch   special
hi! link jsonNoise          noise
hi! link jsonString         string
hi! link jsonQuote          quote

" make
hi! link makeCommands           command
hi! link makeComment            comment

" NOTE:  I don't really like this..  When I think of something like "$(VVAL)",
"   I think of the color purple (And its shades), or the color green.
hi! link makeIdent              variable
hi! link makePreCondit          preCondit
hi! link makeTarget             functionName

" Markdown
hi! link mkdCode                preProc
hi! link mkdDelimiter           special
hi! link mkdLink                reference
hi! link mkdNonListItemBlock    normal
hi! link mkdURL                 url

" Python
hi! link pythonBuiltInFunc      functionName
hi! link pythonBuiltInObj       type
hi! link pythonBytesEscape      escape
hi! link pythonCoding           commentStart
hi! link pythonComment          comment
hi! link pythonConditional      conditional
hi! link pythonDot              dot

" NOTE: Could possibly use "warning" here as well.
hi! link pythonException        statement
hi! link pythonExClass          exception
hi! link pythonFunction         pythonBuiltInFunc
hi! link pythonImport           include

" NOTE: I may change this.
hi! link pythonNone             type
hi! link pythonNumber           number
hi! link pythonOperator         operator
hi! link pythonRepeat           repeat
hi! link pythonRun              commentStart
hi! link pythonStatement        statement
hi! link pythonString           string
hi! link pythonStrFormat        format

" NOTE: This clashes with 'pythonBytesEscape'.  The reason why I'm not using
"   'format' is because when I saw the example of this group, it was one long
"   string, and I did not want an underline through the whole thing.
hi! link pythonStringFormatting special

" rst
hi! link rstEmphasis                            emphasis
hi! link rstInlineLiteral                       string
hi! link rstInterpretedTextOrHyperLinkReference reference
hi! link rstSections                            title
hi! link rstStandaloneHyperlink                 url

" sh
hi! link shArithRegion          preProc
hi! link shComment              comment

" NOTE: This was originally "string", but "echo -e", the "-e" part to me is
"   of an "Option", hense why I have used the hilight group "option".
hi! link shEcho                 option
hi! link shOption               option
hi! link shQuote                quote

" TODO: Reword this to make sense.
" NOTE: Despite the name being "shSingleQuote", the example of which I based my
"   decision off of here, was content that was inside of a single quote.
"   "shSingleQuote" was not actually displaying its usage for a quote.
hi! link shSingleQuote          string


" NOTE: This was originally linked to "operator", but since it says "redir" in
"   the name, which I'm guessing stands for "Redirection", I'm going to use
"   "Special" as the highlight group.
hi! link shRedir                special

" NOTE: Instead of using "statement", I'm using "command" because "echo" to me
"   is more of a "command" rather than a "statement", but depending on what
"   other keywords this is used for, this may be changed back to "statement".
hi! link shStatement            command

" vim buffers
hi  conceal             guifg=#1f1f1f   guibg=NONE      cterm=none
hi  cursorLine          guifg=NONE      guibg=#151515   cterm=none
hi  cursorLineNr        guifg=#ff0000   guibg=#000000   cterm=none
hi  colorColumn         guifg=NONE      guibg=#1e1e1e   cterm=none
hi  lineNr              guifg=#ff0000   guibg=#1e1e1e   cterm=none
hi  matchParen          guifg=#000000   guibg=#ffff00   cterm=none
hi  spellBad            guifg=#b30000   guibg=NONE      cterm=underline
hi  visual              guifg=#ffffff   guibg=#ff8000   cterm=none
hi  vertSplit           guifg=#ff0000   guibg=#1e1e1e   cterm=none

hi! link cursorColumn   cursorLine
hi! link todo           type

" vim
hi  vimCommentString    guifg=#909090   guibg=NONE      cterm=none
"hi  vimFuncVar          guifg=#00eb76   guibg=NONE      cterm=none
hi  vimFuncVar          guifg=#006767   guibg=NONE      cterm=none

hi! link vimCommand         command
hi! link vimComment         comment
hi! link vimCommentTitle    title
hi! link vimContinue        escape
hi! link vimFBVar           vimVar
hi! link vimFgBgAttrib      vimHiAttrib
hi! link vimFTCmd           vimCommand
hi! link vimFTOption        vimOption
hi! link vimFunc            functionName

" NOTE: The only time I have actually seen this group is in whitespace of some
"   functions.
hi! link vimFuncBody        vimFunc
hi! link vimFuncKey         vimCommand
hi! link vimFuncName        vimFunc
hi! link vimFunction        vimFunc
hi! link vimGroup           structure
hi! link vimHiAttrib        attribute
hi! link vimHiBang          vimFunction
hi! link vimHiClear         vimOption
hi! link vimHiCterm         member
hi! link vimHighlight       vimCommand
hi! link vimHiGroup         vimGroup
hi! link vimHiGuiFgBg       vimHiCterm
hi! link vimHiGuiRgb        vimNumber
hi! link vimIsCommand       vimCommand
hi! link vimHiKeyList       vimOper
hi! link vimLet             vimCommand
hi! link vimLineComment     vimComment
hi! link vimNumber          number
hi! link vimNote            note

" I linked 'vimNotFunc' to 'conditional' because when I first discovered
" 'vimNotFunc', it was on an 'if'.
hi! link vimNotFunc     conditional
hi! link vimOper        operator

" NOTE: This colors a lot more than what I originally thought it did.
"   Originally I thought it was the parameters because that's where I
"   discovered this group.
hi! link vimOperParen   parameter
hi! link vimOption      option

" TODO: Change the color of this
hi! link vimParenSep        special
hi! link vimPythonRegion    preProc

" NOTE: I don't know what I want to do with this one as it's the equal sign,
"   value after it in some cases...
" NOTE: 'vimHiKeyList' which I have only seen to be an equal sign when doing
"   assignments such as 'cterm=bold' is linked to 'vimOper'
hi! link vimSetEqual    vimOper
hi! link vimSetMod      format
hi! link vimString      string
hi! link vimSynType     type
hi! link vimScriptDelim vimComment
hi! link vimTodo        todo
hi! link vimUserFunc    vimFunc
hi! link vimVar         variable
finish

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

