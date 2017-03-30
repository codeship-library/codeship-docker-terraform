FROM hashicorp/terraform:light
LABEL maintainer="Codeship Inc, support@codeship.com"

RUN mkdir -p /data
WORKDIR /data

COPY . ./

RUN terraform get

ENTRYPOINT ["/bin/terraform"]
CMD ["version"]
