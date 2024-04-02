import os
import markdown
import json
import sys

def generate_html_content(markdown_content):
    # Convert Markdown content to HTML
    html_content = markdown.markdown(markdown_content)
    return html_content

def create_index_html(directory):
    index_html = "<html><head><title>Linux Man Pages Markdown Index managed by Pratik Raj (@rajpratik71)</title></head><body><h1>Linux Man Pages Markdown Index managed by Pratik Raj (@rajpratik71)</h1><ul>"
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".md"):
                filepath = os.path.join(root, file)
                with open(filepath, "r", encoding="utf-8") as f:
                    content = f.read()
                    html_content = generate_html_content(content)
                    # Add link to index HTML
                    index_html += f"<li><a href='{filepath}'>{file}</a></li>"
    index_html += "</ul></body></html>"
    with open("index.html", "w", encoding="utf-8") as index_file:
        index_file.write(index_html)

# Get the current path from command-line arguments
current_path = sys.argv[1] if len(sys.argv) > 1 else "."

# Example usage:
create_index_html(current_path)
