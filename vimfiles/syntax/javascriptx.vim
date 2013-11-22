" Vim syntax file
" Language:     Markdown
" Maintainer:   Tim Pope <vimNOSPAM@tpope.org>
" Filenames:    *.markdown
" Last Change:	2010 May 21
"

" Vim syntax file
" Language:     JavaScript
" Maintainer:   Yi Zhao (ZHAOYI) <zzlinux AT hotmail DOT com>
" Last Change:  June 4, 2009
" Version:      0.7.7
" Changes:      Add "undefined" as a type keyword
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascrptx'
endif

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn sync minlines=10
"syn case ignore

"" Drop fold if it set but VIM doesn't support it.
let b:javascript_fold='true'
if version < 600    " Don't support the old version
  unlet! b:javascript_fold
endif

"" dollar sigh is permittd anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" JavaScript comments
syntax keyword javaScriptCommentTodo    TODO FIXME XXX TBD contained
syntax region  javaScriptLineComment    contained start=+\/\/+ end=+$+ keepend contains=javaScriptCommentTodo,@Spell
syntax region  javaScriptLineComment    contained start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=javaScriptCommentTodo,@Spell fold
syntax region  javaScriptCvsTag         contained start="\$\cid:" end="\$" oneline
syntax region  javaScriptComment        contained start="/\*"  end="\*/" contains=@markdownInJS,javaScriptCommentTodo,javaScriptCvsTag,@Spell fold

"matches the following symbols: α β Γ γ δ Δ ω Ω μ τ Θ σ Σ λ Λ π Π Φ φ χ Ψ ψ
syntax match javaScriptXGreekLetters  contained "\%d945\|\%d946\|\%d915\|\%d947\|\%d948\|\%d916\|\%d969\|\%d937\|\%d956\|\%d964\|\%d920\|\%d963\|\%d931\|\%d955\|\%d923\|\%d960\|\%d928\|\%d934\|\%d966\|\%d967\|\%d936\|\%d968"

"" JSDoc support start
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

  "" syntax coloring for javadoc comments (HTML)
  "syntax include @javaHtml <sfile>:p:h/html.vim
  "unlet b:current_syntax

  syntax region javaScriptDocComment    contained matchgroup=javaScriptComment start="/\*\*\s*$"  end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,javaScriptCvsTag,@javaScriptHtml,@Spell fold
  syntax match  javaScriptDocTags       contained "@\(param\|argument\|requires\|exception\|throws\|type\|class\|extends\|see\|link\|member\|module\|method\|title\|namespace\|optional\|default\|base\|file\)\>" nextgroup=javaScriptDocParam,javaScriptDocSeeTag skipwhite
  syntax match  javaScriptDocTags       contained "@\(beta\|deprecated\|description\|fileoverview\|author\|license\|version\|returns\=\|constructor\|private\|protected\|final\|ignore\|addon\|exec\)\>"
  syntax match  javaScriptDocParam      contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax region javaScriptDocSeeTag     contained matchgroup=javaScriptDocSeeTag start="{" end="}" contains=javaScriptDocTags

  syntax case match
endif   "" JSDoc end

syntax case match

"" Syntax in the JavaScript code
syntax match   javaScriptSpecial        contained "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
syntax region  javaScriptStringD        contained start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptStringS        contained start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptRegexpString   contained start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=javaScriptSpecial,@htmlPreproc oneline
syntax match   javaScriptNumber         contained /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syntax match   javaScriptFloat          contained /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax match   javaScriptLabel          contained /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"" JavaScript Prototype
syntax keyword javaScriptPrototype      contained prototype

"" Programm Keywords
syntax keyword javaScriptSource         contained import export
syntax keyword javaScriptType           contained const this undefined var void yield window document
syntax keyword javaScriptOperator       contained delete new in instanceof let typeof
syntax keyword javaScriptBoolean        contained true false
syntax keyword javaScriptNull           contained null

"" Statement Keywords
syntax keyword javaScriptConditional    contained if else
syntax keyword javaScriptRepeat         contained do while for
syntax keyword javaScriptBranch         contained break continue switch case default return
syntax keyword javaScriptStatement      contained try catch throw with finally

syntax keyword javaScriptGlobalObjects  contained Array Boolean Date Function Infinity JavaArray JavaClass JavaObject JavaPackage Math Number NaN Object Packages RegExp String Undefined java netscape sun

syntax keyword javaScriptExceptions     contained Error EvalError RangeError ReferenceError SyntaxError TypeError URIError

syntax keyword javaScriptFutureKeys     contained abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public

"" DOM/HTML/CSS specified things

  " DOM2 Objects
  syntax keyword javaScriptGlobalObjects  contained DOMImplementation DocumentFragment Document Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
  syntax keyword javaScriptExceptions     contained DOMException

  " DOM2 CONSTANT
  syntax keyword javaScriptDomErrNo       contained INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
  syntax keyword javaScriptDomNodeConsts  contained ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE

  " HTML events and internal variables
  syntax case ignore
  syntax keyword javaScriptHtmlEvents     contained onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize
  syntax case match

" Follow stuff should be highligh within a special context
" While it can't be handled with context depended with Regex based highlight
" So, turn it off by default
if exists("javascript_enable_domhtmlcss")

    " DOM2 things
    syntax match javaScriptDomElemAttrs     contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
    syntax match javaScriptDomElemFuncs     contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=javaScriptParen skipwhite
    " HTML things
    syntax match javaScriptHtmlElemAttrs    contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
    syntax match javaScriptHtmlElemFuncs    contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=javaScriptParen skipwhite

    " CSS Styles in JavaScript
    syntax keyword javaScriptCssStyles      contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
    syntax keyword javaScriptCssStyles      contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
    syntax keyword javaScriptCssStyles      contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
    syntax keyword javaScriptCssStyles      contained bottom height left position right top width zIndex
    syntax keyword javaScriptCssStyles      contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
    syntax keyword javaScriptCssStyles      contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
    syntax keyword javaScriptCssStyles      contained listStyle listStyleImage listStylePosition listStyleType
    syntax keyword javaScriptCssStyles      contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
    syntax keyword javaScriptCssStyles      contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
    syntax keyword javaScriptCssStyles      contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
    syntax keyword javaScriptCssStyles      contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor

    " Highlight ways
    syntax match javaScriptDotNotation      contained "\." nextgroup=javaScriptPrototype,javaScriptDomElemAttrs,javaScriptDomElemFuncs,javaScriptHtmlElemAttrs,javaScriptHtmlElemFuncs
    syntax match javaScriptDotNotation      contained "\.style\." nextgroup=javaScriptCssStyles

endif "DOM/HTML/CSS

"" end DOM/HTML/CSS specified things


"" Code blocks
syntax cluster javaScriptAll       contains=@markdownInJS,javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptStringD,javaScriptStringS,javaScriptRegexpString,javaScriptXGreekLetters,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptType,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFunction,javaScriptConditional,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptExceptions,javaScriptFutureKeys,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation
syntax region  javaScriptBracket   contained matchgroup=javaScriptBracket transparent start="\[" end="\]" contains=@javaScriptAll,javaScriptParensErrB,javaScriptParensErrC,javaScriptBracket,javaScriptParen,javaScriptBlock,@htmlPreproc
syntax region  javaScriptParen     contained matchgroup=javaScriptParen   transparent start="("  end=")"  contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrC,javaScriptParen,javaScriptBracket,javaScriptBlock,@htmlPreproc
syntax region  javaScriptBlock     contained matchgroup=javaScriptBlock   transparent start="{"  end="}"  contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock,@htmlPreproc 

"" catch errors caused by wrong parenthesis
syntax match   javaScriptParensError    contained ")\|}\|\]"
syntax match   javaScriptParensErrA     contained "\]"
syntax match   javaScriptParensErrB     contained ")"
syntax match   javaScriptParensErrC     contained "}"

if main_syntax == "javascrptx"
  syntax sync clear
  syntax sync ccomment javaScriptComment minlines=200
  syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif

"" Fold control
if exists("b:javascript_fold")
    syntax match   javaScriptFunction       /\<function\>/ nextgroup=javaScriptFuncName skipwhite
    syntax match   javaScriptOpAssign       /=\@<!=/ nextgroup=javaScriptFuncBlock skipwhite skipempty
    syntax region  javaScriptFuncName       contained matchgroup=javaScriptFuncName start=/\%(\$\|\w\)*\s*(/ end=/)/ contains=javaScriptLineComment,javaScriptComment nextgroup=javaScriptFuncBlock skipwhite skipempty
    syntax region  javaScriptFuncBlock      contained matchgroup=javaScriptFuncBlock start="{" end="}" contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock fold

    if &l:filetype=='javascriptx' && !&diff
      " Fold setting
      " Redefine the foldtext (to show a JS function outline) and foldlevel
      " only if the entire buffer is JavaScript, but not if JavaScript syntax
      " is embedded in another syntax (e.g. HTML).
      setlocal foldmethod=syntax
      setlocal foldlevel=4
    endif
else
    syntax keyword javaScriptFunction       function
    setlocal foldmethod<
    setlocal foldlevel<
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment              Comment
  HiLink javaScriptLineComment          Comment
  HiLink javaScriptDocComment           Comment
  HiLink javaScriptCommentTodo          Todo
  HiLink javaScriptCvsTag               Function
  HiLink javaScriptDocTags              Special
  HiLink javaScriptDocSeeTag            Function
  HiLink javaScriptDocParam             Function
  HiLink javaScriptStringS              String
  HiLink javaScriptStringD              String
  HiLink javaScriptRegexpString         String
  HiLink javaScriptCharacter            Character
  HiLink javaScriptPrototype            Type
  HiLink javaScriptConditional          Conditional
  HiLink javaScriptBranch               Conditional
  HiLink javaScriptRepeat               Repeat
  HiLink javaScriptStatement            Statement
  HiLink javaScriptFunction             Function
  HiLink javaScriptError                Error
  HiLink javaScriptParensError          Error
  HiLink javaScriptParensErrA           Error
  HiLink javaScriptParensErrB           Error
  HiLink javaScriptParensErrC           Error
  HiLink javaScriptOperator             Operator
  HiLink javaScriptType                 Type
  HiLink javaScriptNull                 Type
  HiLink javaScriptNumber               Number
  HiLink javaScriptFloat                Number
  HiLink javaScriptXGreekLetters        Number
  HiLink javaScriptBoolean              Boolean
  HiLink javaScriptLabel                Label
  HiLink javaScriptSpecial              Special
  HiLink javaScriptSource               Special
  HiLink javaScriptGlobalObjects        Special
  HiLink javaScriptExceptions           Special

  HiLink javaScriptDomErrNo             Constant
  HiLink javaScriptDomNodeConsts        Constant
  HiLink javaScriptDomElemAttrs         Label
  HiLink javaScriptDomElemFuncs         PreProc

  HiLink javaScriptHtmlEvents           Special
  HiLink javaScriptHtmlElemAttrs        Label
  HiLink javaScriptHtmlElemFuncs        PreProc

  HiLink javaScriptCssStyles            Label

  delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster    mdJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascrptx"
if main_syntax == 'javascrptx'
  unlet main_syntax
endif

syn match markdownValid '[<>]\S\@!'
syn match markdownValid '&\%(#\=\w*;\)\@!'

syn match markdownLineStart "^[<@]\@!" nextgroup=@markdownBlock

syn cluster markdownBlock contains=markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6,markdownBlockquote,markdownListMarker,markdownOrderedListMarker,markdownCodeBlock,markdownRule,markdownAttr,markdownCodeAttr
syn cluster markdownInline contains=markdownLineBreak,markdownLinkText,markdownItalic,markdownBold,markdownCode,markdownEscape,@htmlTop

syn match markdownH1 "^.\+\n=\+$" contained contains=@markdownInline,markdownHeadingRule
syn match markdownH2 "^.\+\n-\+$" contained contains=@markdownInline,markdownHeadingRule

syn match markdownHeadingRule "^[=-]\+$" contained

syn region markdownH1 matchgroup=markdownHeadingDelimiter start="^##\@!"      end="#*\s*$" keepend oneline contains=@markdownInline contained
syn region markdownH2 matchgroup=markdownHeadingDelimiter start="^###\@!"     end="#*\s*$" keepend oneline contains=@markdownInline contained
syn region markdownH3 matchgroup=markdownHeadingDelimiter start="^####\@!"    end="#*\s*$" keepend oneline contains=@markdownInline contained
syn region markdownH4 matchgroup=markdownHeadingDelimiter start="^#####\@!"   end="#*\s*$" keepend oneline contains=@markdownInline contained
syn region markdownH5 matchgroup=markdownHeadingDelimiter start="^######\@!"  end="#*\s*$" keepend oneline contains=@markdownInline contained
syn region markdownH6 matchgroup=markdownHeadingDelimiter start="^#######\@!" end="#*\s*$" keepend oneline contains=@markdownInline contained

syn match markdownText "^\(\[^-=#@\]\| \|\w\|\\\|\*\|/\) \{0,2\}\S.*$" contained

syn cluster markdownInJS contains=markdownHeadingRule,markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6,markdownAttr,markdownEscapedCodeBlock,markdownEscapedCodeBlock2,markdownText

syn region markdownEscapedCodeBlock start="^@escape.*\n" end="$" contains=markdownAttr,@mdJavascript
syn region markdownEscapedCodeBlock2 start="^```.\+\n" end="$" contains=markdownAttrCode,@mdJavascript

syn match markdownBlockquote ">\s" contained nextgroup=@markdownBlock

syn region markdownCodeBlock start="^    \|\t" end="$" contains=@mdJavascript

" TODO: real nesting
syn match markdownListMarker "^ \{0,3\}[-*+]\%(\s\+\S\)\@=" contained
syn match markdownOrderedListMarker "^ \{0,3}\<\d\+\.\%(\s*\S\)\@=" contained

syn match markdownRule "^ \{0,3}\* *\* *\*[ *]*$" contained
syn match markdownRule "^ \{0,3}- *- *-[ -]*$" contained

syn match markdownLineBreak "\s\{2,\}$"

syn region markdownIdDeclaration matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=markdownUrl skipwhite
syn match markdownUrl "\S\+" nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrl matchgroup=markdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" keepend nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained
syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained
syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

syn region markdownItalic start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=markdownLineStart
syn region markdownItalic start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=markdownLineStart
syn region markdownBold start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=markdownLineStart
syn region markdownBold start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=markdownLineStart
syn region markdownBoldItalic start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=markdownLineStart
syn region markdownBoldItalic start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend contains=markdownLineStart
syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" transparent keepend contains=markdownLineStart
syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart

syn match markdownAttrStart "^@\h\w*"
syn region markdownAttr start="^@\h\w*" end="$" contains=markdownAttrStart,markdownText
syn match markdownAttrCode "^```$"

syn match markdownEscape "\\[][\\`*_{}()#+.!-]"

hi def link markdownText                  Normal

hi def link markdownH1                    htmlH1
hi def link markdownH2                    htmlH2
hi def link markdownH3                    htmlH3
hi def link markdownH4                    htmlH4
hi def link markdownH5                    htmlH5
hi def link markdownH6                    htmlH6
hi def link markdownHeadingRule           markdownRule
hi def link markdownHeadingDelimiter      Delimiter
hi def link markdownAttrStart             Boolean
hi def link markdownEscapedCodeBlock      Boolean
hi def link markdownAttrCode              htmlH1
hi def link markdownOrderedListMarker     markdownListMarker
hi def link markdownListMarker            htmlTagName
hi def link markdownBlockquote            Comment
hi def link markdownRule                  PreProc

hi def link markdownLinkText              htmlLink
hi def link markdownIdDeclaration         Typedef
hi def link markdownId                    Type
hi def link markdownAutomaticLink         markdownUrl
hi def link markdownUrl                   Float
hi def link markdownUrlTitle              String
hi def link markdownIdDelimiter           markdownLinkDelimiter
hi def link markdownUrlDelimiter          htmlTag
hi def link markdownUrlTitleDelimiter     Delimiter

hi def link markdownItalic                htmlItalic
hi def link markdownBold                  htmlBold
hi def link markdownBoldItalic            htmlBoldItalic
hi def link markdownCodeDelimiter         Delimiter

hi def link markdownEscape                Special

sign define wholeline linehl=Documentation

let g:mdMaxCursorSearchDist = 20

function! MDGetStart(cursor, min)
    let cursor = a:cursor
    let min = a:min

    if min < 0
        let min = 0
    end

    while cursor > min
        let line = getline(cursor)

        if line != ""
            let s = matchstr( line, '^    ' )

            if s == ""
                return cursor
            end
        end

        let cursor = cursor-1
    endwhile

    return cursor
endfunction

" a delay, so it doesn't highlight on *every* cursor stroke,
" but every few strokes.

let g:mdCursorTickDelay = 4
let g:mdCursorTickDelayCount = 0

function! MDBlockHighlightCursor()
    if g:mdCursorTickDelayCount < 0
        let g:mdCursorTickDelayCount = g:mdCursorTickDelay

        let cursor = line('.')

        let startCursor = MDGetStart( cursor, cursor-g:mdMaxCursorSearchDist )

        let lastCursor = line('$')
        if cursor < lastCursor
            let lastCursor = cursor + 3
        end

        call MDBlockHighlight( startCursor, lastCursor, lastCursor+g:mdMaxCursorSearchDist )
    else
        let g:mdCursorTickDelayCount = g:mdCursorTickDelayCount - 1
    end
endfunction

function! MDBlockHighlightAll()
    sign unplace *

    call MDBlockHighlight( 0, line("$"), line("$") )
endfunction

function! MDBlockHighlight( i, maxI, maxSearch )
    let i = a:i
    let maxI = a:maxI
    let maxSearch = a:maxSearch

    let isMarkdown = 1

    let lastLine = line("$")

    while i <= maxI
        if isMarkdown == 1
            let endI = MDGetMarkdownEnd( i, maxSearch )
            let line = getline(endI)

            " 
            " Pad out by an extra line, after the markdown.
            " Unless it's followed by a header rule,
            " such as ...
            "
            "       ----------------------------------
            "
            " ... however ignore headers, such as
            "
            "       this is a header, text before --'s
            "       ----------------------------------
            "
            
            let indentBeyond = 1

            if matchstr(line, '^[-](-\| )\+$') != "" && matchstr(line, '^[=](=\| )\+$') != ""
                if endI > 0 && getline(endI-1) != ""
                    let indentBeyond = 1
                else
                    let indentBeyond = 0
                end
            end

            if indentBeyond == 1
                if endI < lastLine
                    if endI+1 == lastLine
                        if getline(endI+1) == ""
                            endI = lastLine
                        end
                    else
                        if getline(endI+1) == "" && getline(endI+2) == ''
                            let endI = endI+1
                        end
                    end
                end
            end

            if i == 1
                if getline(0) == ""
                    let i = 0
                end
            elseif i > 1
                let currentLine = getline(i)

                if matchstr(currentLine, '^[-]\(-\| \)\+$') == "" && matchstr(currentLine, '^[=]\(=\| \)\+$') == ""
                "if matchstr(currentLine, '^[-]\+$') == "" && matchstr(currentLine, '^[=]\+$') == ""
                    if getline(i-1) == "" && getline(i-2) == ""
                        let i = i-1
                    end
                end
            end

            call MDHighlight( i, endI, maxSearch )

            let isMarkdown = 0
        else
            let endI = MDGetMarkdownStart( i, maxSearch )
            call MDUnhighlight( i, endI, maxSearch )

            let isMarkdown = 1
        end

        " should never happen, but I'm worried about my logic, so just to be
        " sure
        if endI <= i
            let i = i+1
        else
            let i = endI+1
        end
    endwhile
endfunction

function! MDGetMarkdownStart( i, maxI )
    let i = a:i
    let endI = i
    let maxI = a:maxI

    while i <= maxI
        let line = getline(i)

        if line == "" || matchstr(line, '^    ') != "" || matchstr(line, '^\t') != ""
            let endI = i
        else
            return endI
        end

        let i = i+1
    endwhile

    return maxI
endfunction

function! MDGetMarkdownEnd( i, maxI )
    let i = a:i
    let endI = i
    let maxI = a:maxI

    let isMarkdown = 1
    let isExample = 0
    let isCode = 0

    while i <= maxI
        let line = getline(i)

        " if a code block
        if matchstr(line, '^    ') != "" || matchstr(line, '^\t') != ""
            if isExample == 1
                let isCode = 1
            else
                let isMarkdown = 0
            end
        elseif line == "" && isCode == 1
            let isCode = 0
            let isExample = 0
        end

        if isMarkdown == 1
            if matchstr(line, '^@example') != "" || matchstr(line, '^```') != ""
                let isExample = 1
            end
        end

        if isMarkdown == 1
            if line != ""
                let endI = i
            end
        else
            return endI
        end

        let i = i+1
    endwhile

    return maxI
endfunction

function! MDHighlight( startI, endI, maxI )
    let i = a:startI
    let endI = a:endI
    let buffNo = bufnr('%')

    if endI > a:maxI
        let endI = a:maxI
    end

    while i <= endI
        exec 'sign place ' . (i+1) . ' name=wholeline line='.i.' buffer='.buffNo

        let i = i+1
    endwhile
endfunction

function! MDUnhighlight( startI, endI, maxI )
    let i = a:startI
    let endI = a:endI
    let buffNo = bufnr('%')

    if endI > a:maxI
        let endI = a:maxI
    end

    while i <= endI
        exec 'sign unplace ' . (i+1) . ' buffer='.buffNo

        let i = i+1
    endwhile
endfunction

augroup MDDocHighlighting
    autocmd!

    autocmd BufWinEnter,BufWrite,VimEnter,CursorHold,CursorHoldI *.jsx call MDBlockHighlightAll()
    autocmd CursorMovedI *.jsx call MDBlockHighlightCursor()
augroup END

