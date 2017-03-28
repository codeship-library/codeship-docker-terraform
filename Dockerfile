FROM hashicorp/terraform:light
LABEL \
  org.label-schema.vendor="Person Name" \
  org.label-schema.url="https://github.com/codeship-examples/codeship-docker-terraform \
  org.label-schema.name="Codeship Example" \
  org.label-schema.license="MIT" \
  org.label-schema.vcs-url="https://github.com/codeship-examples/codeship-docker-terraform" \
  org.label-schema.schema-version="1.0"

RUN mkdir -p /data
WORKDIR /data

COPY . ./

RUN terraform get

ENTRYPOINT ["/bin/terraform"]
CMD ["version"]
