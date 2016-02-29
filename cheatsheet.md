# Cheatsheet

## Vim

  - `h` = Move cursor left
  - `j` = Move cursor down
  - `k` = Move cursor up
  - `l` = Move cursor right

Currently this `.vimrc` has no remap for arrow keys in normal mode.

|Command             | Description                           |
|--------------------| --------------------------------------|
|`dt:`               | Delete on the line up to the `:`      |
|`df:`               | Delete on the line right after the `:`|
|`d$`                | Delete to the end of the line         |
|`dd`                | Delete whole line                     |
|`:%s/find/replace/g`| Global find and replace               |
|`c`                 | Change                                |
|`vat`               | Visually selecting around tag         |
|`vit`               | Visually selecting inside tag         |
|`Vs<span>`          | Surrond line with `<span>` tag        |
|`VS<div>`           | Indent line inside `<div>` tag        |
|`gg=G`              | Reindent the file                     |
|`Ctrl + P`          | Open file finder                      |
|`P`                 | Paste                                 |
|`yy`                | Yank current line                     |
|`5yy`               | Yank 5 lines                          |
|`=`                 | Formatter in visual mode              |
|`V%`                | Select whole class                    |
|`:%s/\s\+$//e`      | Removes trailing whitespace.          |

Commands are composeable 

  - `dw` Delete word
  - `d2w` Delete 2 words
  - `d4j` Delete 4 lines down


## Command Line Utilities

### Ag
The Silver Searcher

```:Ag [options] [pattern] [path/to/dir]```

- [Vim :Ag search and replace, globally and within a directory | Stack Overflow](http://stackoverflow.com/questions/22206332/vim-ag-search-and-replace-globally-and-within-a-directory)
- [Project-wide find and replace | Vimcasts](http://vimcasts.org/episodes/project-wide-find-and-replace/)

### Cloc
Count Lines of Code

`cloc` just needs one file name argument but a comparison:

```cloc --diff file1.txt file2.txt```

### Ren
Rename Files

Maintains file names while changing their extension

```ren '*.md' '#1.markdown'```


### Hub
CLI Wrapper for working with Git on Github.com

- `hub browse` -- opens repo & branch on Github.com
- `hub clone repo` -- clone your own repo of that name
- `hub clone owner/repo` -- clones repo and resolves .git URL during clone
- `hub issue` -- lists all issues
- `hub pull-request -m "PR message" -b owner:branch -h owner:branch` -- pull request from the command line
