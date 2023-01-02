# render-tex

## Example
```yaml
name: Render LaTeX document

on: [push]

jobs:
  render_latex:
    runs-on: ubuntu-latex
    name: render
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Render
        uses: actions/render-tex
        with:
          run: |
            make
      - name: Upload artifacts
        uses: actions/upload-artifact@v3
        with:
          path: ./*.pdf
```
