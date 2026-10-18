#!/usr/bin/env python3
"""OCR fallback for scanned Class 1 GK PDFs (no extractable text layer).

Usage:
    python3 tool/ocr_pdf.py <pdf-name-without-ext>

Renders each page to an image with pdf2image and runs pytesseract over it,
writing <name>.txt with "=== PAGE n ===" markers, same format as extract_pdf.py.
"""
import sys
from pathlib import Path

import pytesseract
from pdf2image import convert_from_path

SOURCE_DIR = Path(__file__).resolve().parent.parent / "source"


def ocr(pdf_path: Path) -> Path:
    txt_path = pdf_path.with_suffix(".ocr.txt")
    pages = convert_from_path(str(pdf_path), dpi=300)
    with open(txt_path, "w", encoding="utf-8") as out:
        for i, page in enumerate(pages, start=1):
            text = pytesseract.image_to_string(page)
            out.write(f"=== PAGE {i} ===\n")
            out.write(text)
            out.write("\n\n")
            print(f"  page {i}/{len(pages)} done ({len(text.strip())} chars)")
    print(f"{pdf_path.name}: {len(pages)} pages OCR'd -> {txt_path.name}")
    return txt_path


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 tool/ocr_pdf.py <pdf-stem>")
        sys.exit(1)
    stem = sys.argv[1]
    pdf_path = SOURCE_DIR / f"{stem}.pdf"
    if not pdf_path.exists():
        print(f"Not found: {pdf_path}")
        sys.exit(1)
    ocr(pdf_path)


if __name__ == "__main__":
    main()
