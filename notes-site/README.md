# My Zettelkasten

A personal digital garden built with [MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), styled after [m0wer/memento](https://github.com/m0wer/memento). Three sections — **Podcast/Video Notes**, **Lecture Notes**, **Book Notes** — each broken into nested dropdowns, with an auto-generated table of contents on every note.

## 1. First-time setup

### a. Replace the placeholders

Five values in this project need to be your real GitHub username/repo name. Run this from the project root, swapping in your details:

```bash
# macOS / Linux
grep -rl "YOUR_USERNAME\|YOUR_REPO\|YOUR_NAME" . --include="*.yml" --include="*.md" \
  | xargs sed -i '' -e 's/YOUR_USERNAME/your-github-username/g' \
                     -e 's/YOUR_REPO/your-repo-name/g' \
                     -e 's/YOUR_NAME/Your Name/g'
```

(Drop the empty `''` after `-i` on Linux; macOS's `sed` needs it.)

Or just open `mkdocs.yml` and `docs/index.md` and find/replace by hand — there are only a handful of spots.

### b. Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/your-github-username/your-repo-name.git
git push -u origin main
```

### c. Turn on GitHub Pages

The included GitHub Action (`.github/workflows/deploy.yml`) runs `mkdocs gh-deploy` on every push to `main`, which builds the site and pushes it to a `gh-pages` branch. After your first push:

1. Go to **Settings → Pages** in your repo.
2. Under **Source**, choose **Deploy from a branch**.
3. Pick the **gh-pages** branch, `/ (root)` folder.
4. Save. Your site will be live at `https://your-github-username.github.io/your-repo-name/` within a minute or two.

## 2. Local preview

```bash
make install   # or: pip install -r requirements.txt
make serve     # or: mkdocs serve
```

Then open `http://127.0.0.1:8000`. The preview auto-reloads as you edit.

## 3. Adding a new note (the daily workflow)

1. Create a markdown file in the right folder, e.g.:
   `docs/book_notes/my_new_book.md`
2. Structure it with headings (`##`, `###`) — these automatically populate the right-side table of contents, same as the reference site.
3. Add it to the `nav:` list in `mkdocs.yml`, in the matching section:
   ```yaml
   - Book Notes:
       - Example Book: book_notes/example_book.md
       - My New Book: book_notes/my_new_book.md
   ```
4. Commit and push:
   ```bash
   git add .
   git commit -m "Add note: My New Book"
   git push
   ```
5. That's it — the Action rebuilds and redeploys automatically. No manual publish step.

### Adding a whole new dropdown/category

To add a new sub-category (e.g. a new podcast show, or a new course), create a new folder under the relevant section and add a new nested entry under it in `mkdocs.yml`, following the same pattern as `Tech Podcasts` or `Computer Science 101`.

## 4. What's already wired up

- **Right-side table of contents** on every note — automatic from your headings, no config needed.
- **Nested sidebar dropdowns** — defined explicitly in `mkdocs.yml`'s `nav:` tree, same approach as the reference site.
- **Light/dark mode** that follows the visitor's system preference.
- **Search** with highlighting and suggestions.
- **Math rendering** (MathJax) for lecture notes with formulas — wrap math in `\( ... \)` or `\[ ... \]`.
- **Admonition callouts** (`!!! note`, `!!! example`, `!!! warning`, etc.) — used in the placeholder notes.
- **Tabbed content, task lists, code copy buttons, "last updated" timestamps** — all from Material's built-in feature set.

## 5. Migrating your existing notes

Drop your existing markdown files into the matching folder under `docs/`, add each one to `mkdocs.yml`'s `nav:`, and push. If you'd rather hand me the files directly, I can convert and slot them into this same structure for you.
