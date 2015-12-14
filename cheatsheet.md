# Cheatsheet

## Vim

  - `h` = Move cursor left
  - `j` = Move cursor down
  - `k` = Move cursor up
  - `l` = Move cursor right


|Command             | Description                           |
|--------------------| --------------------------------------|
|`dt=`               | Delete on the line up to the`=`       |
|`df=`               | Delete on the line right after the `=`|
|`d$`                | Delete to the end of the line         |
|`dd`                | Delete whole line                     |
|`:%s/find/replace/g`| Global find and replace               |
|`c`                 | Change                                |
|`cat`               | Change around tag                     |
|`Vs<span>`          | Surrond line with `<span>` tag        |
|`VS<div>`           | Indent line inside `<div>` tag        |
|`gg=G`              | Reindent the file                     |
|`Ctrl + P`          | Open file finder                      |
|`yy`                | Yank current line                     |

Commands are composeable 

  - `dw` Delete word
  - `d2w` Delete 2 words
  - `d4j` Delete 4 lines down
