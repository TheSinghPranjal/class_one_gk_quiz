#!/usr/bin/env python3
"""One-time dev helper: extract text from the Class 1 GK source PDF(s).

Usage:
    python3 tool/extract_pdf.py

Reads every PDF in source/ and writes <name>.txt next to it, with
"=== PAGE n ===" markers between pages. If a PDF yields (almost) no text,
it is flagged as likely scanned/image-based so OCR can be used instead.
"""
import sys
from pathlib import Path

import pdfplumber

SOURCE_DIR = Path(__file__).resolve().parent.parent / "source"


def extract(pdf_path: Path) -> Path:
    txt_path = pdf_path.with_suffix(".txt")
    total_chars = 0
    with pdfplumber.open(pdf_path) as pdf, open(txt_path, "w", encoding="utf-8") as out:
        for i, page in enumerate(pdf.pages, start=1):
            text = page.extract_text() or ""
            total_chars += len(text.strip())
            out.write(f"=== PAGE {i} ===\n")
            out.write(text)
            out.write("\n\n")
    avg_chars = total_chars / max(1, len(pdf.pages))
    print(f"{pdf_path.name}: {len(pdf.pages)} pages, {total_chars} chars total, "
          f"{avg_chars:.0f} chars/page avg -> {txt_path.name}")
    if avg_chars < 20:
        print(f"  !! WARNING: {pdf_path.name} looks like a SCANNED/IMAGE PDF "
              f"(almost no extractable text). OCR (pytesseract + pdf2image) is needed.")
    return txt_path


def main():
    pdfs = sorted(SOURCE_DIR.glob("*.pdf"))
    if not pdfs:
        print(f"No PDFs found in {SOURCE_DIR}")
        sys.exit(1)
    for pdf_path in pdfs:
        extract(pdf_path)


if __name__ == "__main__":
    main()
