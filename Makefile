notebook: the_annotated_transformer.py
	jupytext --to ipynb the_annotated_transformer.py

py: the_annotated_transformer.ipynb
	jupytext --to py:percent the_annotated_transformer.ipynb

the_annotated_transformer.ipynb: the_annotated_transformer.py
	jupytext --to ipynb the_annotated_transformer.py

execute: the_annotated_transformer.py
	jupytext --execute --to ipynb the_annotated_transformer.py

html: the_annotated_transformer.ipynb
	jupytext --execute --to ipynb the_annotated_transformer.py
	jupyter nbconvert --to html the_annotated_transformer.ipynb

the_annotated_transformer.md: the_annotated_transformer.ipynb
	jupyter nbconvert --to markdown  --execute the_annotated_transformer.ipynb

blog: the_annotated_transformer.md
	pandoc docs/header-includes.yaml the_annotated_transformer.md  --katex=/usr/local/lib/node_modules/katex/dist/ --output=docs/index.html --to=html5 --css=docs/github.min.css --css=docs/tufte.css --no-highlight --self-contained --metadata pagetitle="The Annotated Transformer" --resource-path=/home/srush/Projects/annotated-transformer/ --indented-code-classes=nohighlight



flake: the_annotated_transformer.ipynb
	flake8 --show-source the_annotated_transformer.py

black: the_annotated_transformer.ipynb
	black --line-length 79 the_annotated_transformer.py

clean: 
	rm -f the_annotated_transformer.ipynb

setup:
	pip install -r requirements.txt
