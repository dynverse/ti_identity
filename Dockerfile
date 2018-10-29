FROM dynverse/dynwrap:r

LABEL version 0.1.6

ADD . /code

ENTRYPOINT Rscript /code/run.R
