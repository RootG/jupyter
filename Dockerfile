FROM alpine

RUN apk add --update build-base python3-dev nodejs zeromq-dev

COPY requirements.txt .
RUN python3 -m pip install --upgrade -r requirements.txt
COPY user-settings /root/.jupyter/lab/user-settings

RUN mkdir -p /jupyter/notebooks
VOLUME /jupyter
EXPOSE 8888
WORKDIR /jupyter

CMD jupyter lab --ip=0.0.0.0 --no-browser --allow-root --notebook-dir='notebooks' --NotebookApp.token=''
