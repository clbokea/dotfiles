set number
set autowriteall
set background=light

" Show working filename
set laststatus=2

" Navigation
"Use :find xxx to look for files in current dir and subfolders. 
set path+=**
set wildmenu

filetype indent plugin on

let mapleader=","
set timeout timeoutlen=1500

"""""""""""""""""""""""""""""""""""
" Disable Swap files
"""""""""""""""""""""""""""""""""""
set noswapfile
set backupcopy=yes

"set nobackup       "no backup files
"set nowritebackup  "only in case you don't want a backup file while editing
"set noswapfile     "no swap files


"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""

" if the vim plugins manager vim-plug is not present, install it
" using the system wide .vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

" Start intro screen
" Plug 'mhinz/vim-startify'

call plug#end()

""""""""""""""""""""""""
"" plugin end """"""""""
""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" color themes
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'hard'
syntax on

" togle background light/dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Fix indentation
" map <F7> gg=G<C-o><C-o>



" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only
" loaded _after_ all files are.
" " Trying disable MatchParen after loading all plugins
function! g:FckThatMatchParen ()
	if exists(":NoMatchParen")
		:NoMatchParen
	endif
endfunction

augroup plugin_initialize
	autocmd!
	autocmd VimEnter * call FckThatMatchParen()
augroup END

" Access system clipboard
set clipboard=unnamed

" Display filename of working file



" snippet mapping
" nnoremap ,html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" On linux """
"set noshowmatch

"set foldmethod=indent
"set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za


" For startify
"let s:header = ['~/python_introduction> ']
"let s:footer = ['</__goodbye_Python__>']

"function! s:center(lines) abort
"  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
"  let centered_lines = map(copy(a:lines),
"        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
"  return centered_lines
"endfunction

"let g:startify_custom_header = s:header
"let g:startify_custom_footer = s:center(s:footer)