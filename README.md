<div align="center">

<img src="https://raw.githubusercontent.com/neu-data/.github/main/assets/banner.svg" alt="Neudata Consulting Ltd" width="100%" />

# Neudata LaTeX document template

**Reports, proposals and technical notes in the Neudata house style — ready for Overleaf.**

[![Open in Overleaf](https://img.shields.io/badge/Open%20in-Overleaf-055F56?style=flat&logo=overleaf&logoColor=white)](https://www.overleaf.com/docs?snip_uri=https://raw.githubusercontent.com/neu-data/latex-report-template/main/overleaf.zip)
![LaTeX](https://img.shields.io/badge/LaTeX-document%20class-0B376C?style=flat&logo=latex&logoColor=white)
![Neudata](https://img.shields.io/badge/Neudata-brand-04242F?style=flat)

</div>

---

See the compiled example: [`examples/example.pdf`](examples/example.pdf).

## What you get

- **Cover page** — logo, document type, teal title and subtitle, "Prepared for" client, author, date, reference, version and classification, Neudata contact line
- **Headers and footers** — document title and logo above a teal rule; classification, `Neudata | #ClearDataClearImpact` and `page / total` below
- **Teal section headings** with a thin rule, blue sub-sections
- **`keyfindings`** and **`neudatanote`** boxes
- **Navy table header rows** with `\neudataheader` and `\neudatath{}`
- **Closing copyright page** with `\neudatacopyrightpage`
- Author–year references with biblatex

## Use it on Overleaf

Click **Open in Overleaf** above, or download [`overleaf.zip`](overleaf.zip) and use **New Project → Upload Project**. Overleaf's default **pdfLaTeX** compiler and biber are used automatically.

## Use it locally

```bash
git clone https://github.com/neu-data/latex-report-template.git my-report
cd my-report
latexmk -pdf main.tex
```

## Front matter

```latex
\documentclass[report]{neudata}       % report | proposal | note, plus draft, nocover

\title{Report Title}
\subtitle{Short descriptive subtitle}
\author{Analyst Name, Neudata Consulting Ltd}
\client{Client organisation}
\reference{NDC-2026-000}
\version{1.0}
\confidentiality{Confidential}
% \date{29-04-2026}                   % defaults to today, DD-MM-YYYY

\begin{document}
\maketitle
...
\neudatacopyrightpage
\end{document}
```

## Building blocks

```latex
\begin{keyfindings}
  \begin{itemize}
    \item Finding one, with its size and uncertainty.
  \end{itemize}
\end{keyfindings}

\begin{neudatanote}[Reproducibility]
  All results were produced from version-controlled code.
\end{neudatanote}

\begin{tabular}{lrr}
  \toprule
  \neudataheader \neudatath{Group} & \neudatath{N} & \neudatath{\%} \\
  \midrule
  Overall & 1,200 & 84.2 \\
  \bottomrule
\end{tabular}
```

Add `draft` to the class options for a DRAFT watermark.

---

<div align="center">

**Neudata Consulting Ltd** · *Insight. Impact. Innovation.*
[www.neu-data.com](https://www.neu-data.com) · [contact@neu-data.com](mailto:contact@neu-data.com)

</div>
