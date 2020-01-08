syntax on
set nu
execute pathogen#infect()
set background=dark
colorscheme mrkn256
filetype plugin indent on

set hlsearch

" 80 characters line
set colorcolumn=81
"execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if exists("g:loaded_linuxsty")
    finish
endif
let g:loaded_linuxsty = 1

set wildignore+=*.ko,*.mod.c,*.order,modules.builtin

augroup linuxsty
    autocmd!

    autocmd FileType c,cpp call s:LinuxConfigure()
    autocmd FileType diff setlocal ts=8
    autocmd FileType kconfig setlocal ts=8 sw=8 sts=8 noet
    autocmd FileType dts setlocal ts=8 sw=8 sts=8 noet
augroup END

function s:LinuxConfigure()
    let apply_style = 0

    if exists("g:linuxsty_patterns")
        let path = expand('%:p')
        for p in g:linuxsty_patterns
            if path =~ p
                let apply_style = 1
                break
            endif
        endfor
    else
        let apply_style = 1
    endif

    if apply_style
        call s:LinuxCodingStyle()
    endif
endfunction

command! LinuxCodingStyle call s:LinuxCodingStyle()

function! s:LinuxCodingStyle()
    call s:LinuxFormatting()
    call s:LinuxKeywords()
    call s:LinuxHighlighting()
endfunction

function s:LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:LinuxKeywords()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
    syn keyword cType __u8 __u16 __u32 __u64 __s8 __s16 __s32 __s64
endfunction

function s:LinuxHighlighting()
    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\%>80v[^()\{\}\[\]<>]\+/ " virtual column 81 and more

    " Highlight trailing whitespace, unless we're in insert mode and the
    " cursor's placed right after the whitespace. This prevents us from having
    " to put up with whitespace being highlighted in the middle of typing
    " something
    autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
    autocmd InsertLeave * match LinuxError /\s\+$/
endfunction

" vim: ts=4 et sw=4

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" https://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" Show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" Show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" Auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" Auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" Auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" Don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0

" extend clipboard
set clipboard=unnamedplus

set t_Co=256

set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags


set tags+=/home/mircea/work/zctags/iio_scope-tags
set tags+=/home/mircea/work/zctags/linux-tags
set tags+=/home/mircea/work/zctags/linux_work-tags
set tags+=/home/mircea/work/zctags/no-OS-tags
set tags+=/home/mircea/work/zctags/tags.sh-tags
