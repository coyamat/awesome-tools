" 一般設定
set expandtab         " タブの代わりにスペース
set tabstop=2         " タブ文字の占める幅
set shiftwidth=2      " インデントの挿入/削除されるスペース数
set softtabstop=2     " タブ相当のスペース数
set smartindent	      " 自動でインデント
set showmatch         " カッコの対応付
set number            " 行番号を表示
set ruler             " カーソル位置の行, 列を表示
set cursorline        " 現在の行を強調表示
set visualbell        " ベルの代わりに画面点滅
set title             " 編集中のファイル名を表示

" 追加設定
set modelines=0	      " modelineを無効化
set backspace=2	      " バクスペースが効かない対策


" 検索設定
set hlsearch          " 検索ワードをハイライト
set incsearch         " リアルタイムで検索
set ignorecase        " 大文字小文字の区別なし

syntax on
au BufRead,BufNewFile *.tf set filetype=hcl

" Installation::
" mkdir -p ~/.vim/syntax
" curl -o ~/.vim/syntax/hcl.vim https://raw.githubusercontent.com/hashivim/vim-terraform/master/syntax/hcl.vim


" HJKL on insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Modified code
nnoremap == gg=G
