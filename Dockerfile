FROM dynverse/dynwrapr:v0.1.0

COPY definition.yml run.R example.h5 /code/

ENTRYPOINT ["/code/run.R"]
