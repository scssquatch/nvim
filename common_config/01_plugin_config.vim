call dein#begin(expand('~/.vim/dein')) " plugins' root path
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('tweekmonster/startuptime.vim')

  call dein#source('colors/*')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-repeat')
  call dein#add('vim-scripts/matchit.zip')
  call dein#add('vim-scripts/ruby-matchit')
  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-sleuth')
  call dein#add('slim-template/vim-slim')
  call dein#add('mxw/vim-jsx')

" Neomake for async static linting
  call dein#add('neomake/neomake')
    let g:neomake_eruby_rubocop_maker = {'exe': 'rubocop'}
    let g:neomake_eruby_enabled_makers = ['rubocop']
    let g:neomake_elixir_enabled_makers = ['mix']
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
    let g:neomake_haml_enabled_makers = ['hamllint']
    autocmd! BufWritePost * Neomake

" NERDTree for project drawer
  call dein#add('scrooloose/nerdtree')
    let NERDTreeHijackNetrw = 0
    let NERDTreeIgnore=['\.rbc$', '\~$']
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    map <Leader>nt :NERDTreeToggle<CR>

" Vim airline configs
  call dein#add('vim-airline/vim-airline')

" Supertab code completion
  call dein#add('ervandew/supertab')
  let g:SuperTabContextDefaultCompletionType = '<c-n>'

" AG aka The Silver Searcher
  call dein#add('rking/ag.vim')
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gl :cwindow<CR>

" CtrlP
  call dein#add('ctrlpvim/ctrlp.vim')
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>
    map <Leader>cpc :CtrlPClearCache<CR>

    " The Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = "ag %s -l --nocolor --hidden -g ''"

      let g:ctrlp_use_caching = 1
    endif

" Tagbar for navigation by tags using CTags
  call dein#add('majutsushi/tagbar')
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>
    map <C-\> :tnext<CR>

" ZoomWin to fullscreen a particular buffer without losing others
  call dein#add('troydm/zoomwintab.vim')
    map <Leader>z :ZoomWinTabToggle<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  call dein#add('tpope/vim-unimpaired')
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

" gundo for awesome undo tree visualization
  call dein#add('mbbill/undotree')
    map <Leader>h :UndotreeToggle<CR>

" rails.vim, nuff' said
  call dein#add('tpope/vim-rails')
    map <Leader>oc :Econtroller<Space>
    map <Leader>ov :Eview<Space>
    map <Leader>om :Emodel<Space>
    map <Leader>oh :Ehelper<Space>
    map <Leader>oj :Ejavascript<Space>
    map <Leader>os :Estylesheet<Space>
    map <Leader>oi :Eintegration<Space>
    " John Papa recommended angular naming conventions
    let g:rails_projections = {
      \  'app/assets/*.js.coffee': {
      \     'alternate': 'spec/{}.spec.js.coffee'
      \   },
      \  'app/assets/*.js': {
      \     'alternate': 'spec/{}.spec.js'
      \   },
      \  'app/assets/*.coffee': {
      \     'alternate': 'spec/{}.spec.coffee'
      \   },
      \  'spec/*.spec.js.coffee': {
      \     'alternate': 'app/assets/{}.js.coffee'
      \   },
      \  'spec/*.spec.js': {
      \     'alternate': 'app/assets/{}.js'
      \   },
      \  'spec/*.spec.coffee': {
      \     'alternate': 'app/assets/{}.coffee'
      \   }
      \}

" surround for adding surround 'physics'
  call dein#add('tpope/vim-surround')
    " # to surround with ruby string interpolation
    let g:surround_35 = '#{\r}'
    " - to surround with no-output erb tag
    let g:surround_45 = '<% \r %>'
    " = to surround with output erb tag
    let g:surround_61 = '<%= \r %>'

" Easy async RSpec running
  call dein#add('thoughtbot/vim-rspec')
  call dein#add('tpope/vim-dispatch')
  let g:rspec_command = '!bundle exec rspec --format=progress --no-profile {spec}'
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

" Elixir vim stuff
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('c-brenn/phoenix.vim')
  call dein#add('tpope/vim-projectionist')

call dein#end()

if dein#check_install()
  call dein#install()
endif
