hi clear Normal
set bg&

hi clear
if exists("syntax_on")
    syn reset
endif

let colors_colors = "cmptrclr"

hi method                       guifg=#0087bd   guibg=NONE      cterm=none
hi dot                          guifg=#8040e0 guibg=NONE  cterm=bold
hi function                     guifg=#006a40 guibg=NONE  cterm=none
hi class                        guifg=#efcc00 guibg=NONE    cterm=none
hi operator                     guifg=#8040e0 guibg=NONE  cterm=none

hi cursorLine                 guifg=NONE    guibg=#151515 cterm=none
hi cursorColumn               guifg=NONE    guibg=#151515 cterm=none
hi normal                     guifg=#eeeeee guibg=#000000 cterm=none
hi colorColumn                guifg=NONE    guibg=#202020 cterm=none
hi lineNR                     guifg=#ff0000 guibg=#202020 cterm=none
hi vertSplit                  guifg=#000000 guibg=#202020 cterm=none
hi folded                     guifg=#505050 guibg=#202020 cterm=none

hi signColumn                 guifg=NONE    guibg=#000000 cterm=none
hi gitGutterAdd               guifg=#00ff00 guibg=NONE    cterm=none
hi gitGutterChange            guifg=#ffff00 guibg=NONE    cterm=none
hi gitGutterDelete            guifg=#ff0000 guibg=NONE    cterm=none
hi gitGutterChangeDelete      guifg=#ffc000 guibg=NONE    cterm=none

hi gitGutterChangeDeleteLine  guibg=#c08000 guifg=NONE    cterm=none

hi diffAdd                    guifg=NONE    guibg=#008000 cterm=none
hi diffChange                 guifg=NONE    guibg=#808000 cterm=none
hi diffDelete                 guifg=NONE    guibg=#800000 cterm=none

hi matchParen                 guifg=#ffff00 guibg=NONE    cterm=underline

hi visual                     guifg=NONE    guibg=#ff8000 cterm=none

hi spellBad                   guifg=#ff0000 guibg=NONE    cterm=underline,bold
hi specialKey                 guifg=#ff6400 guibg=NONE    cterm=none

hi comment                    guifg=#505050 guibg=NONE    cterm=none
hi constant                   guifg=#ffd000 guibg=NONE    cterm=none
hi error                      guifg=#800000 guibg=#ff0000 cterm=none
hi identifier                 guifg=#408000 guibg=NONE    cterm=none
hi preProc                    guifg=#ff00ff guibg=NONE    cterm=none
hi special                    guifg=#800000 guibg=NONE    cterm=none
hi statement                  guifg=#0000ff guibg=NONE    cterm=none
hi todo                       guifg=#ff4500 guibg=NONE    cterm=none
hi type                       guifg=#ff6500 guibg=NONE    cterm=none
hi underlined                 guifg=#aa8000 guibg=NONE    cterm=none

hi cCharacter                 guifg=#aa0000 guibg=NONE  cterm=none
hi cCommentStart              guifg=#404040 guibg=NONE  cterm=none
hi cConditional               guifg=#8000aa guibg=NONE  cterm=none
hi cDefine                    guifg=#800080 guibg=NONE  cterm=none
hi cFormat                    guifg=#800000 guibg=NONE  cterm=underline
hi cNumber                    guifg=#ff0000 guibg=NONE  cterm=none
hi cOperator                  guifg=#8040e0 guibg=NONE  cterm=none
hi cPreCondit                 guifg=#8000c4 guibg=NONE  cterm=none
hi cRepeat                    guifg=#8060aa guibg=NONE  cterm=none
hi cStorageClass              guifg=#ffd000 guibg=NONE  cterm=none
hi cString                    guifg=#904090 guibg=NONE  cterm=none
hi cStructure                 guifg=#ff8000 guibg=NONE  cterm=none

hi cTagsDefinedName           guifg=#c400c4 guibg=NONE  cterm=none
hi cTagsEnumerationValue      guifg=#800040 guibg=NONE  cterm=none
hi cTagsEnumeratorName        guifg=#408000 guibg=NONE  cterm=none
hi link cTagsFunction               function
"hi cTagsFunction              guifg=#006a40 guibg=NONE  cterm=none
hi cTagsGlobalVariable        guifg=#ffff00 guibg=NONE  cterm=none
hi cTagsMember                guifg=#ffb000 guibg=NONE  cterm=none

hi link cComment            comment
hi link cConstant           constant
hi link cCppString          cString
hi link cInclude            preProc
hi link cIncluded           cSpecial
hi link cLabel              underlined
hi link cOctal              cNumber
hi link cOctalZero          cFormat
hi link cPreConditMatch     cPreCondit
hi link cPreProc            preProc
hi link cSpecial            special
hi link cStatement          statement
hi link cTodo               todo
hi link cType               type

hi link cTagsStructure      cStructure
hi link cTagsType           type

hi link cppNumber           cNumber

hi link confComment         cComment

" Originally constant
hi link confString          cString


hi link cfgComment          cComment
hi link cfgValues           cTagsEnumerationValue

hi link decNumber           cNumber
"hi link asmDirective        cLabel
"hi link asmIdentifier       identifier

hi link sedComment          cComment
hi link sedST               identifier
hi link sedSpecial          cSpecial
hi link sedRegexpMeta        cFormat
hi link sedRegexp47         cPreProc
hi link  sedReplacement47   constant
hi link sedReplaceMeta      cSpecial
hi link sedFlag             cPreProc

hi link dclStart            cFormat
hi link dclComment          cComment
hi link dclTodo             todo
hi link dclVarName          cLabel
hi link dclInstr            cStatement
hi link dclExe              cStatement
hi link dclAssign           cOperator
hi link dclNumber           cNumber
hi link dclString           cString
hi link dclOper             cOperator
hi link dclLexical          identifier
hi link delimiter           cSpecial
hi link dclMdfySep          cFormat
hi link dclParam            cPreProc
hi link dclDirSep           cSpecial
hi link dclLogSep           cSpecial
hi dclLogical               guifg=#0000aa   guibg=NONE  cterm=none
hi link dclGotoLabel        cLabel
hi link dclLogOper          type
hi link dclDevice           cTagsDefinedName
hi link dclError            error


hi link awkComment          cComment
hi link awkStatement        cStatement
hi link awkLineSkip         cSpecial
hi link awkComma            symPunctEqual
hi link awkArrayElement     cTagsMember
hi link awkOperator         cOperator
hi link awkNumber           cNumber
hi link awkRepeat           cRepeat
hi link awkSemiColon        symOperators
hi link awkString           cString
hi link awkConditional      cConditional
hi link awkSpecialPrintf    cFormat
hi link awkSpecialCharacter cSpecial
hi link awkFunction         cTagsFunction
hi link awkSearch           constant
hi link awkRegExp           cFormat

" this needs to be changed
hi link awkBrktRegExp       type

hi link awkBoolLogic        symOperators
hi link awkBrackets         symBrackets
hi link awkExpression       cOperator
hi link awkPatterns         cSpecial
hi link  awkFieldVars       cTagsGlobalVariable


hi link xmlProcessDelim     cCommentStart
hi link xmlProcessing       cComment
hi link xmlString           cString
hi link xmlEqual            symPunctEqual
hi link xmlAttrib           cType
hi link xmlDocTypeDecl      cCommentStart
hi link xmlDocTypeKeyword   cStatement
hi link xmlDocType          cType
hi link xmlTag              htmlTag
hi link xmlTagName          htmlTagName
hi link xmlCommentStart     cCommentStart
hi link xmlCommentPart      cComment
hi link xmlCOmment          cComment
hi link xmlEndTag           htmlEndTag

hi htmlBold                   guifg=#eeeeee guibg=NONE    cterm=bold
hi htmlEndTag                 guifg=#509000 guibg=NONE    cterm=underline
hi link htmlArg             type
hi link htmlItalic          normal
hi link htmlString          cString
hi link htmlTag             identifier
hi link htmlTagN            htmlTagName
hi link htmlTagName         statement

" Orignally comment
hi link makeComment         cComment

" Orignally constant
hi link makeCommands        statement

hi link makeBString         identifier
hi link makeEscapeChar      special
hi link makeIdent           identifier

" Orignally preProc
hi link makeInclude         cInclude

hi link makeNextLine        special

" Originally special
hi link makeCmdNextLine     makeNextLine

" Originally COnstant
hi link makeDString         cString
hi link makeSString         cString

hi link makeSpecial         special
hi link makeSpecTarget      statement
hi link makeTarget          identifier
hi link makePreCondit       cPreCondit

hi markdownCode          guifg=#ff00ff guibg=#222222 cterm=none
hi markdownCodeDelimiter    guifg=#800000   guibg=#222222   cterm=none
hi markdownItalic             guifg=#999999 guibg=NONE    cterm=none
hi markdownUrl                guifg=#0000ee guibg=NONE    cterm=underline


hi title                    guifg=#00ff00   guibg=NONE  cterm=none


" I've got this set to 'identifier' to correspond what color the html tag would
" be.
hi link markdownBold                htmlBold
hi link markdownBoldDelimiter       identifier
hi link markdownEscape              special
hi link markdownHeadingDelimiter    special
hi link markdownH                   title
hi link markdownH1                  markdownH
hi link markdownH2                  markdownH
hi link markdownH3                  markdownH
hi link markdownH4                  markdownH
hi link markdownH5                  markdownH
hi link markdownH6                  markdownH
hi link markdownId                  type
hi link markdownIdDeclaration       type
"hi link markdownItalic              cCommentStart
hi link markdownItalicDelimiter     markdownBoldDelimiter
hi link markdownLinkDelimiter       markdownBoldDelimiter
hi link markdownLinkTextDelimiter   markdownLinkDelimiter
hi link markdownLinkText            underlined
hi link markdownListMarker          markdownHeadingDelimiter
hi link markdownUrlTitle            markdownH
hi link markdownUrlTitleDelimiter   markdownBoldDelimiter


hi link informNumber                cNumber
hi link informRepeat                cRepeat
hi link informOperator              cOperator
hi link informPredicate             cOperator
hi link informStatement             cStatement
hi link informPreProc               cPreProc
hi link informInclude               cInclude

hi link mmpComment                  cComment
hi link mmpStorage                  cStorageClass

hi link m4Type                      cType
hi link m4Special                   cSpecial
hi link m4Comment                   cComment
hi link m4Command                   statement
hi link m4Function                  cTagsFunction
hi link m4Delimiter                 cSpecial
hi link m4Paren                     symParen
hi link m4String                    cString
hi link m4Variable                  cPreProc
hi link m4Statement                 cStatement
hi link m4Special                   cSpecial
hi link m4PreProc                   cPreProc


hi link configComment               cComment
hi link configFunction              cTagsFunction
hi link configDelimiter             cSpecial
hi link configNumber                cNumber
hi link configKeyword               cStatement
hi link configOperator              cOperator
hi link configString                cString
hi link configSpecial               cSpecial


" Using title what I'm basing it off of right now is the date that the changeLog was log fuck it you kow what I mean.
hi link changeLogNumber             title

hi link changeLogHeader             cInclude
hi changeLogMail                    guifg=#00aaff   guibg=NONE  cterm=underline
hi link changeLogBullet             identifier
hi link changeLogFiles              constant

" May use cComment but there is text that isn't grouped that wont correlate
hi link changeLogText               normal

hi link changeLogColon              changeLogBullet
hi link changeLogFuncs              cTagsFunction


" Orignally comment
hi link shComment                     cComment

hi link shStatement                     cStatement

" This was already set to 'constant' by default, but the source I was looking at, did not accuratly dispaly what esactly
" this group highlights.  So keep an eye out.
" echo seems to just be the message that is 'echoed'.  So ima make it a cString
hi link shEcho                          cString

" I'm using constant, even though I'm ot happy with it because obviously there is a reason wquotes are highlighted, and
" using the colorgorup string would most lily obe pintless.
hi shQuote                      guifg=#ff0000   guibg=NONE  cterm=none
hi link shDoubleQuote               cString

hi link shSpecial                   cSpecial
hi link shDerefSimple               identifier
hi link shConditional               cConditional

" I have no idea what this is,but the trans is shIf
hi link shFunctionOne               cTagsClass

" This is probably going to look really bad..
hi link shTestPattern               cFormat

hi link shTestOpr                   cOperator
hi link shNumber                    cNumber
hi link shOperator                  cOperator
hi link shOption                    vimHighlight

hi link shFunction                    cTagsFunction

hi link shVariable                    cTagsGlobalVariable
hi link shDerefVar                      identifier
hi shCommandSub                 guifg=#0000aa guibg=NONE    cterm=none

" Orignally shVarAssign
hi link shVarAssign                   cOperator

hi link shCaseIn                    cRepeat

" I have no idea what this is
hi link shCaseEsac                  constant

" I'm going to guess that "Sngl" stands for signal...
hi link shSnglCase                  cFormat

hi link shCase                      cLabel
hi link shLoop                      cRepeat

" Exampel was showing a variable used in a for loop
hi link shFor                       identifier

hi link symParens                     cDefine
hi link symBraces                     cType
hi link symOperators                  cOperator
hi link symOutParam                   cFormat
hi link symAnd                        cOperator
hi symPlusGreater             guifg=#00ff00 guibg=NONE    cterm=none
hi symSubtractLessBang        guifg=#ff0000 guibg=NONE    cterm=none
hi symPunctEqual              guifg=#ffff00 guibg=NONE    cterm=none

hi vimAugroup                 guifg=#809e46 guibg=NONE    cterm=none

" Not certain for what this may bei
hi vimAugroupKey              guifg=#ffff00 guibg=NONE    cterm=none
hi vimAutoEvent               guifg=#eeff00 guibg=NONE    cterm=none
hi vimCommentTitle            guifg=#00ff00 guibg=NONE    cterm=none
hi vimHighlight               guifg=#0080ff guibg=NONE    cterm=none
"hi vimHiClear                 guifg=#00a0ff guibg=NONE    cterm=none

" Another Transparent group I'm assuming.
hi vimSet                     guifg=#ffffff guibg=NONE    cterm=none
hi vimSynKeyRegion            guifg=#888888 guibg=NONE    cterm=none
"hi vimUserAttrb               guifg=#0000d0 guibg=NONE    cterm=none
"hi vimUserAttrbKey            guifg=#0000c0 guibg=NONE    cterm=none
"hi vimUserCmd                 guifg=#008080 guibg=NONE    cterm=none
"hi vimUserCommand             guifg=#0080a0 guibg=NONE    cterm=none
hi vimLet                     guifg=#008080 guibg=NONE    cterm=none
hi vimVar                     guifg=#00ffff guibg=NONE    cterm=none

" This was found on blank space.  I think it's safe to call what I'm thinking
" about 'Transparent'?..  I could be though.
"
" On another note, I just noticed that there are integers with that group color
" name.
"
" So this will be experimental for now until I am sure of the outcome.
hi link vimExecute          cNumber

hi link vimAutoCmd          statement

" This may be also possibly concisered as the area for whi regex is wrote
hi link vimAutoCmdSfxList   special
hi link vimComment          comment
hi link vimCommand          cStatement
hi link vimCommentString    cCommentStart
hi link vimConditional      cConditional
hi link vimContinue         cSpecial
hi link vimFgBgAttrib       cTagsEnumerationValue
hi link vimFTCmd            cTagsEnumeratorName
hi link vimFTOption         cTagsEnumerationValue
hi link vimFuncKey          cStatement
hi link vimFuncName         cTagsFunction
hi link vimFunction         cTagsFunction
hi link vimGroup            cStorageClass
hi link vimGroupName        cStorageClass
hi link vimHiAttrib         cTagsEnumerationValue
hi link vimHiClear          cTagsDefinedName
hi link vimHiCTerm          cTagsEnumeratorName
hi link vimHiGuiRgb         cConstant
hi link vimHiGroup          cStorageClass
hi link vimHiGuiFgBg        cStructure
hi link vimHiKeyList        cOperator
hi link vimIsCommand        vimSynKeyRegion
hi link vimLineComment      cComment
hi link vimNotFunc          cStatement
hi link vimNumber           cNumber
hi link vimOper             cOperator
hi link vimOperParen        cOperator
hi link vimOption           cPreProc
hi link vimParanSep         cOperator

" I'm going with 'cFormat' because if this group is for escaping and such, I
" see that as kind of being a 'format' beacuse it's a pattern nonetheless.
hi link vimPatSep           cFormat
hi link vimRepeat           cRepeat
hi link vimSetEqual         cOperator
hi link vimSetMod           cFormat

" My have issues with this because 'cFormat' is underlined..
hi link vimSetSep           cFormat
hi link vimString           cString
hi link vimSynKeyOpt        cTagsDefinedName
hi link vimSynType          cType
hi link vimUserAttrb        cSpecial
hi link vimUserAttrbKey     cTagsDefinedName
hi link vimUserCmd          cSpecial
hi link vimUserCommand      cStatement
hi link vimUserFunc         cTagsFunction

hi link cCommentL           cComment
hi cFloat                   guifg=#ff00aa   guibg=NONE  cterm=none
hi link cUserLabel          cLabel
hi link cUserCont           cSpecial

hi symPointer                 guifg=#ffff00 guibg=NONE  cterm=none


hi link dtdEnum             constant
hi link dtdType             cType
hi link dtdCard             identifier
hi link dtdTag              htmlTag
hi link dtdFunction         cCommentStart


hi link objImport           cPreProc
hi link objcImported        cIncluded
hi link objcString          cString
hi link objcClass           cTagsClass
hi link objcLiteralSyntaxOp cOperator
hi link objcPrincipalType   cType
hi link objcType            cType
hi objcHiddenArgument       guifg=#0000aa   guibg=NONE  cterm=none
hi objcMethodCall              guifg=#00406a guibg=NONE  cterm=none


hi link pythonDot           dot
hi link pythonExtraOperator operator
hi link pythonExceptions    type
hi link pythonInclude       cPreProc
hi link pythonComment       cComment
hi link pythonnStatement    cStatement
hi link pythonFunction      cTagsFunction
hi link pythonNumber        cNumber
hi link pythonDecorator     cOperator
hi link pythonConditional   cConditional
hi link pythonString        cString
hi link pythonRepeat        cRepeat
hi link pythonOperator      cOperator
hi link pythonTODO          todo
hi link pythonQuotes        cSpecial
hi link pythonRawString     cFormat
hi link pythonEscape        cSpecial
hi link pythonBuiltin       identifier


hi link cMakeStatement      cStatement
hi link cMakeComment        cComment
hi link cMakeArguments      cPreProc
hi link cMakeSystemVariables    cTagsDefinedName
hi link cMakeOperators      cOperator
hi link cMakeVariableValue  cTagsEnumerationValue
hi link cMakeString         cString
hi link cMakeEscaped         cSpecial
hi link cMakeRegistry       cFormat

" I'm pfobalby oging to want to change this to its own darkish orangis color

" May use statement

hi cTagsClass               guifg=#00ff00   guibg=NONE  cterm=none



finish

hi csClass                    guifg=#00ffff guibg=NONE  cterm=none
hi csEnum                     guifg=#408000 guibg=NONE  cterm=none
hi csEnumMember               guifg=#800040 guibg=NONE  cterm=none

hi link csClassOrStructTag  csClass
hi link csConditional       cConditional
hi link csConstant          preProc
hi link csNumber            cNumber
hi link csRepeat            cRepeat
hi link csStatment          statement
hi link csStorage           cStorageClass
hi link csString            cString
hi link csType              type

hi link csMethod            cFunction
hi link csStructure         cStructure


hi symPointer                 guifg=#ffff00 guibg=NONE  cterm=none

"hi link cIncluded                     special
"hi link cCppString                    cString
"hi cNumber                guifg=#ff0000 guibg=NONE    cterm=none
"hi link cOctal                        cNumber
"hi cString                guifg=#904090 guibg=NONE    cterm=none

"hi cCharacter             guifg=#aa0000 guibg=NONE    cterm=none
"hi cCommentStart          guifg=#404040 guibg=NONE    cterm=none
"hi link cComment                      comment
"hi cStorageClass          guifg=#ffd000 guibg=NONE    cterm=none
"hi cStructure             guifg=#ff8000 guibg=NONE    cterm=none
"hi cType                  guifg=#ff6500 guibg=NONE    cterm=none

"hi link cSpecial                      special
"hi cDefine                guifg=#800080 guibg=NONE    cterm=none
"hi link cInclude                      preProc
"hi cPreCondit             guifg=#8000c4 guibg=NONE    cterm=none
"hi link cPreConditMatch               cPreCondit
"hi link cOctalZero                    cFormat

"hi cOperator              guifg=#8040e0 guibg=NONE    cterm=none

"hi cRepeat                guifg=#8060aa guibg=NONE    cterm=none
