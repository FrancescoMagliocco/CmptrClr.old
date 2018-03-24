se nocp                     " set nocompatible

" Turns on syntax highlighting.
syn on                      " syntax on

filet off

" I use my username explicitly here so I can use the config file for root.
se rtp+=/home/anonrate/.vim/bundle/Vundle.vim
cal vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'qpkorr/vim-bufkill'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
"Plugin 'kendling/TagHighlight'
Plugin 'lervag/vimtex'
Plugin 'abudden/taghighlight-automirror'
"Plugin 'Anonrate/TagHighlight'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'ap/vim-css-color'
Plugin 'valloric/matchtagalways'
Plugin 'edkolev/promptline.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'matze/vim-move'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'farmergreg/vim-lastplace'
" If ever actually working with cmake, here is a plugin to use
" Plugin 'vhdirk/vim-cmake'
" website is obviously https://github.com/vhdirk/vim-cmake

" Old but may be of use.  Looks like it requres 'Omnicomplete' which I don't
" want to use.
"Plugin 'jaxbot/github-issues.vim'

" I thought this was a plugin that would open a split window, allowing for use
" of bash commands and to see their output, but I thikn I was wrong.
"Plugin 'jarrodctaylor/vim-shell-executor'

" Potentiall usful I suppose in a way.  Hasn't been updated in 4 years.
"Plugin 'maksimr/vim-translator'

" Not sure if vim has this built in or not, but looks like can be of use.  Just
" there is only 3 users so I'm not sure if that meets my 'needs' for a 'usful'
" plugin.
"Plugin 'tibabit/vim-todo'

" At first I think I thought this plugin may be usful, but not exactly sure
" why.  Sometimes I have issues or rather get frustrated when using tab
" complete, but I tried and couldn't replicate the issue.  So I will just leave
" it here for possible future needs..
"Plugin 'ervandew/supertab'

" Thought this would be possibly usful as well since I always fuck around with
" choosing characters to be used when editing weechat.
"Plugin 'chrisbra/unicode.vim'

"Plugin 'yggdroot/indentline'

" Not sure if this Plugin does what I want it to, it also hasn't been updated
" in 3 years, but I guess I will give it a try.
Plugin 'sukima/xmledit'

" This Plugin takes out all of the wrapping.
"Plugin 'gabrielelana/vim-markdown'
cal vundle#end()

colo anoncol

" Turns on specific settings depending on filetype for indentation settings.
filet plugin indent on      " filetype plugin indent on

aug header_template
  au!
  " I use my username explicitly here so I can use the config file for root.
  au bufNewFile *.c,*.h so /home/anonrate/.vim/templates/c.template
  au bufNewFile *.c,*.h exe "1," . 25 . "g/\|FILENAME\|.*/s~~" . expand("%:t")
  au bufNewFile *.c,*.h exe "1," . 25 . "g/\|DATE\|/s~~" . strftime("%m/%d/%Y")
  au bufNewFile *.c,*.h exe "1," . 25 . "g/\|TIME\|/s//" . strftime("%H:%M:%S")
  au bufNewFile *.c,*.h exe "1," . 25 . "g/\|AUTHOR\|/s//Anonrate"
  au bufNewFile *.c,*.h exe "1," . 25 . "g/\|YEAR\|/s//" . strftime("%Y")
aug end

" Sets 'backspace' to '2' which allows backspacing over autoIndents, line
"   breaks and the start of insert.
se bs=2                     " Same as 'se bs=indent,eol,start'.

" Shows where your cursor is by highlighting the the whole column.
se cuc                      " set cursorcolumn

" Shows the current line you're at by outling the whole line.
se cul                      " set cursorline

" Sets the encoding type to 'utf8'.
se enc=utf8                 " set encoding=utf8

" Use spaces instead of tabs.
se et                       " set expandtabs

" Sets the file encoding type to 'utf8'.
se fenc=utf8                " set fileencoding=utf8

" Sets the command history limit to '200'.
se history=200              " set history=200

" Turns on 'list', then sets 'lcs' to have the 'tab' character shown as '>-',
"   and 'trail' (Trailing whitespaces) to be shown as '~'.
"se list lcs=tab:␉␣,trail:~,eol:↵  " set list listchars=tab:>-,trail:~
se nolist

" Always shows the 'laststatus'.
se ls=2                     " set laststatus=2

" Shows line numbers.
se nu                       " set number

" Shows your cursor position.
se ru                       " set ruler

" Shows (partial) command in last line of screen.
" NOTE: Turning off 'showcmd' will increase terminal performance.
se nosc                     " set showcmd

" Turns on smart indenting, for automatic indentation depending on the
"   filetype.
se si                       " set smartindent

" Matches the brack of which your cursor is over, with it's closing or opening
"   bracket, if presetn.
se sm                       " set showmatch (Show matching brackets)

" Shows 'n' lines of context around the cursor.
" NOTE: Setting 'so' to a large value, will result in the cursor always being
"     in the middle of the window (except at start, end or when
"     lines wrap).
se so=16                   " set scrolloff=140
se ss=8
" Sets how much should be indented when you press 'enter'.
se sw=4                     " set shiftwidth=4
se softtabstop=4

" Only use if your terminal supports more than 256 colors.
se tgc                     " set termguicolors

" Sets the amount of spaces used when inserting the 'tab' character.
se ts=8                     " set tabstop=4

" Time out on ':mappings' and key codes.
se ttimeout                 " set ttimeout

" Time waited for key codes or ':mappings' to be completed.
se ttm=100                  " set ttimeoutlen=100

" Sets the maximum amount of characters a line can have before adding another
"   line to 79.  (Not the samething as wrapping)
se tw=120                    " set textwidth=79

" Shows command line completiton.
se wmnu                     " set wildmenu

" Colors column '80' to represent the 'textwidth' setting.  Also colors column
"   column '120'.
"let &cc="80," . join(range(120, 478), ",")
let &cc=121

" Disable loading all extensions.
let g:ariline#extensions#disable_rtp_load = 1

" Load only wanted extensions.
let g:airline_extensions  = [
              \ 'tabline',
              \ 'wordcount',
              \ 'branch',
              \ 'hunks',
              \ 'ale'
              \ ]
" May need to implement 'let g:airline#extensions#ale#enabled = 1 to enable
" 'ale'

" Show buffer numbers.
let g:airline#extensions#tabline#buffer_nr_show           = 1

" Switch position of buffers and tabs on sple tabline.
let g:airline#extensions#tabline#switch_buffers_and_tabs  = 1

" How numbers are displayed in tab mode.
" Splits and tab number
let g:airline#extensions#tabline#tab_nr_type              = 2

fu! SyntaxItem()
  return
    \ 'hi<'
    \ . synIDattr(
    \   synID(line('.'), col('.'), 1),
    \   'name') .
    \ '> trans<'
    \ . synIDattr(
    \   synID(line('.'), col('.'), 0),
    \   'name') .
    \ '> lo<'
    \ . synIDattr(
    \   synIDtrans(synID(line('.'), col('.'), 1)),
    \   'name') .
    \ '>'
endf

let g:airline_section_y = '%{SyntaxItem()}'

let g:gitgutter_max_signs = 9999999

let g:c_syntax_for_h  = 1

let g:vimtex_enabled = 1
let g:airline_powerline_fonts = 1
let g:markdwon_minlines = 100
let g:markdown_syntax_conceal = 0
let g:mta_filetypes = {
            \ 'html'      : 1,
            \ 'xhtml'     : 1,
            \ 'xml'       : 1,
            \ 'jinja'     : 1,
            \ 'markdown'  : 1 }

let g:move_key_modifer  = 'C'

" This disables particule 'linters'
"let g:ale_lingers = {
"            \ 'javascript' : ['eslint'],
"            \ }
let g:ale_sign_error    = '>>'
let g:ale_sign_warning  = '--'
" color groups ALEErrorSign ALEWarningSign
" These maps may interfere with that of the move maps.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(alee_next_wrap)
" NEVER run linters on text changed
"let g:ale_lint_on_text_changed  = 'never'

" Don't/Do run linters on opening of file
"let g:ale_lint_on_enter  = 0|1

" Never/Always run liters on save
"let g:ale_on_save  = 0|1

" Disable/Enable loclist
"let g:ale_set_loclist  = 0|1

" Enable/Disable quickfix
"let g:ale_set_quickfix = 1|0

" Show/Don't Show Vim windows for loclist or quickfix when file contains
" warning or errors.
"let g:ale_open_list  = 1|0

" Always/Never keep windows open after errors dissapear
"let G:ale_keep_list_window_open  = 1|0

"let g:promptline_preset = aqpromptline
            
            
""            \ 'a' : ['\u'],
""            \ 'b' : ['\h'],
""            \ 'c' : ['\w', promptline#slices#git_status(), promptline#slices#vcs_branch()],
""            \ 'd' : ['\$']}
""            \ 'options' : {
""                \ 'right_sections'      : ['warn'],
""                \ 'left_sections_only'  : ['a', 'b', 'c']}}

let g:promptline_theme = "aqpromptline"
""            \ 'a' : [191. 255],
""            \ 'b' : [47, 255],
""            \ 'c' : [21, 255],
""            \ 'd' : [21, 255],
""            \ 'x' : [188, 54],
""            \ 'y' : [97, 21],
""            \ 'z' : [121, 5],
""            \ 'warn'  : [3, 255]}

let g:instant_markdown_autostart = 0

