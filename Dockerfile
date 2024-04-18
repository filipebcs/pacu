FROM python:3.9-alpine

LABEL maintainer="Rhino Assessment Team <pacu@rhinosecuritylabs.com>"
LABEL pacu.version="1.5.3"

RUN apk add --no-cache \
    aws-cli \
    zip gcc build-base libffi-dev

# Install Pacu
WORKDIR /usr/src/pacu/
COPY ./ ./
RUN pip install .
RUN apk --purge del gcc build-base libffi-dev

RUN echo 'AWS_EC2_METADATA_DISABLED=true' >> /etc/profile

ENTRYPOINT ["pacu"]
