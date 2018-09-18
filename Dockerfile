FROM dynverse/dynwrap:r

LABEL version 0.1.4

ADD . /code

ENTRYPOINT Rscript /code/run.R
