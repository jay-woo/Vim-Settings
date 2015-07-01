execute pathogen#infect()

set noshowmode
let g:airline_theme = 'wombat'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" unicode symbols
let g:airline_left_sep = '»' 
let g:airline_left_sep = '▶' 
let g:airline_right_sep = '«' 
let g:airline_right_sep = '◀' 
let g:airline_symbols.linenr = '␊' 
let g:airline_symbols.linenr = '␤' 
let g:airline_symbols.linenr = '¶' 
let g:airline_symbols.branch = '⎇' 
let g:airline_symbols.paste = 'ρ' 
let g:airline_symbols.paste = 'Þ' 
let g:airline_symbols.paste = '∥' 
let g:airline_symbols.whitespace = 'Ξ' 
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#left_sep = '▶'

hi clear
if exists("syntax_on")
   syntax reset
endif

set ttimeoutlen=50
set t_Co=256
set laststatus=2

let colors_name = "vividchalk"

" First two functions adapted from inkpot.vim

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
    return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! s:choose(good,mediocre)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,ctermfg,backup)
    let ctermfg = s:choose(a:ctermfg,a:backup)
    exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,ctermbg,backup)
    let ctermbg = s:choose(a:ctermbg,a:backup)
    exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

hi link railsMethod         PreProc
hi link rubyDefine          Keyword
hi link rubySymbol          Constant
hi link rubyAccess          rubyMethod
hi link rubyAttribute       rubyMethod
hi link rubyEval            rubyMethod
hi link rubyException       rubyMethod
hi link rubyInclude         rubyMethod
hi link rubyStringDelimiter rubyString
hi link rubyRegexp          Regexp
hi link rubyRegexpDelimiter rubyRegexp
"hi link rubyConstant        Variable
"hi link rubyGlobalVariable  Variable
"hi link rubyClassVariable   Variable
"hi link rubyInstanceVariable Variable
hi link javascriptRegexpString  Regexp
hi link javascriptNumber        Number
hi link javascriptNull          Constant

call s:hifg("Normal","#EEEEEE",87,"White")
if &background == "light" || has("gui_running")
    hi Normal guibg=Black ctermbg=NONE
else
    hi Normal guibg=Black ctermbg=NONE
endif
highlight StatusLine    guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White  cterm=bold
highlight StatusLineNC  guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey   cterm=none
highlight WildMenu      guifg=Black   guibg=#ffff00 gui=bold ctermfg=Black ctermbg=Yellow cterm=bold
highlight Cursor        guifg=Black guibg=White ctermfg=Black ctermbg=White
highlight CursorLine    guibg=#333333 guifg=NONE
highlight CursorColumn  guibg=#333333 guifg=NONE
highlight NonText       guifg=#404040 ctermfg=8
highlight SpecialKey    guifg=#404040 ctermfg=8
highlight Directory     none
high link Directory     Identifier
highlight ErrorMsg      guibg=Red ctermbg=DarkRed guifg=NONE ctermfg=NONE
highlight Search        guibg=#555555 ctermbg=Black guifg=NONE ctermfg=NONE gui=none cterm=none
highlight IncSearch     guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight MoreMsg       guifg=#00AA00 ctermfg=Green
highlight LineNr        guifg=#DDEEFF ctermfg=White
call s:hibg("LineNr"    ,"#222222",80,"DarkBlue")
highlight Question      none
high link Question      MoreMsg
highlight Title         guifg=Magenta ctermfg=Magenta
highlight VisualNOS     gui=none cterm=none
call s:hibg("Visual"    ,"#555577",83,"LightBlue")
call s:hibg("VisualNOS" ,"#444444",81,"DarkBlue")
highlight WarningMsg    guifg=Red ctermfg=Red
highlight Folded        guibg=#1100aa ctermbg=DarkBlue
call s:hibg("Folded"    ,"#110077",17,"DarkBlue")
call s:hifg("Folded"    ,"#aaddee",63,"LightCyan")
highlight FoldColumn    none
high link FoldColumn    Folded
highlight Pmenu         guifg=White ctermfg=White gui=bold cterm=bold
highlight PmenuSel      guifg=White ctermfg=White gui=bold cterm=bold
call s:hibg("Pmenu"     ,"#000099",18,"Blue")
call s:hibg("PmenuSel"  ,"#5555ff",39,"DarkCyan")
highlight PmenuSbar     guibg=Grey ctermbg=Grey
highlight PmenuThumb    guibg=White ctermbg=White
highlight TabLine       gui=underline cterm=underline
call s:hifg("TabLine"   ,"#bbbbbb",85,"LightGrey")
call s:hibg("TabLine"   ,"#333333",80,"DarkGrey")
highlight TabLineSel    guifg=White guibg=Black ctermfg=White ctermbg=Black
highlight TabLineFill   gui=underline cterm=underline
call s:hifg("TabLineFill","#bbbbbb",85,"LightGrey")
call s:hibg("TabLineFill","#808080",83,"Grey")

hi Type gui=none
hi railsUserClass gui=italic cterm=underline
hi Statement gui=none
hi Comment gui=italic
"highlight PreProc       guifg=#EDF8F9
call s:hifg("Comment"       ,"#9933CC",51,"DarkMagenta") " 92
call s:hifg("Constant"      ,"#339999",21,"DarkCyan") " 30
call s:hifg("rubyNumber"    ,"#CCFF33",60,"Yellow") " 190
call s:hifg("String"        ,"#66FF00",44,"LightGreen") " 82
call s:hifg("Identifier"    ,"#FFCC00",72,"Yellow") " 220
call s:hifg("Statement"     ,"#FF6600",68,"Brown") " 202
call s:hifg("PreProc"       ,"#AAFFFF",47,"LightCyan") " 213
call s:hifg("Type"          ,"#AAAA77",57,"Grey") " 101
call s:hifg("railsUserClass","#AAAAAA",57,"Grey") " 101
call s:hifg("Special"       ,"#33AA00",24,"DarkGreen") " 7
call s:hifg("Regexp"        ,"#44B4CC",21,"DarkCyan") " 74
call s:hifg("rubyMethod"    ,"#DDE93D",77,"Yellow") " 191
"highlight railsMethod   guifg=#EE1122 ctermfg=1

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
