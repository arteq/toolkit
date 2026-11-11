# Key Bindings – Quick Reference

Notation: `C-` = Ctrl, `M-`/`Alt` = Alt, `S-` = Shift.

---

## 1. Shell (zsh)

### Editing the command line

| Keys | Action |
|------|--------|
| `C-w` | Delete previous word |
| `C-k` | Delete from cursor to end of line  |
| `A-D` | Delete next word |
| `C-x C-e` | Edit current command in `$EDITOR` (nvim) |
| `Esc` then `v`, then `v` | Edit command in `$EDITOR` |
| `C-Left` / `C-Right` | Move one word back / forward |
| `C-a` / `C-e` | Start / end of line |

### History & files

| Keys | Action |
|------|--------|
| `C-r` | fzf history search |
| `C-f` | fzf file picker (no hidden files, bat preview), inserts the path at the cursor |
| `C-t` | fzf multiple files picker (no hidden files, bat preview), inserts the path at the cursor |
| `Space` | Expands `!!` and history references in place (magic-space) |

---

## 2. Neovim

**Leader = `Space`**

### Tabs

| Keys | Action |
|------|--------|
| `C-t` | New tab |
| `Alt-Right` / `Alt-Left` | Next / previous tab (normal & insert mode) |

### Completion (coc.nvim, insert mode)

| Keys | Action |
|------|--------|
| `Tab` / `S-Tab` | Next / previous completion item (triggers completion if the menu is closed) |
| `C-Space` | Trigger completion |
| `Enter` | Confirm the selected completion item |

### Code (coc.nvim, normal mode)

| Keys | Action |
|------|--------|
| `K` | Show documentation / hover |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format selected code (also in visual mode) |
| `<leader>qf` | Apply quick fix to problem on current line |
| `:Format` | Format whole buffer |

### Other

| Keys | Action |
|------|--------|
| `<leader><leader>i` | Icon / emoji picker (normal mode) |
| `C-i` | Icon / emoji picker (insert mode) |

---

## 3. Herdr

**Prefix = `C-a`**

| Keys | Action |
|------|--------|
| `prefix` + `t` | New tab |
| `prefix` + `Right` or `Alt-Right` | Next tab |
| `prefix` + `Left` or `Alt-Left` | Previous tab |

---

## 4. tmux

**Prefix = `C-a`**. Windows and panes are numbered from 1. Mouse is on.

### Splits & panes

| Keys | Action |
|------|--------|
| `prefix` `g` | Split side by side (vertical divider) |
| `prefix` `h` | Split top / bottom (horizontal divider) |
| `Alt-Arrow` | Move to the pane left / right / up / down (no prefix) |
| `prefix` `w` | Kill current pane |

### Windows (tabs)

| Keys | Action |
|------|--------|
| `prefix` `t` | New window |
| `Shift-Left` / `Shift-Right` | Previous / next window (no prefix) |

### Sessions

| Keys | Action |
|------|--------|
| `prefix` `n` | New session |
| `prefix` `C-d` | Detach |
| `prefix` `q` | Kill session |
