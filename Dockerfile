FROM alpine

RUN apk add --update build-base python3-dev

COPY requirements.txt .
RUN python3 -m pip install --upgrade -r requirements.txt

RUN mkdir -p jupyter/notebooks
WORKDIR jupyter
CMD jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --notebook-dir='notebooks' --NotebookApp.token=''
