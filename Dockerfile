# we're using Golang 1.x (1.16.3 at the time of writing)
#             and Debian buster
FROM golang:alpine

# ADD grofer /go/bin/
ADD . /src

WORKDIR /src

RUN go install

WORKDIR /

# host's root (/) is assumed to be mounted at /host
# set env vars for gopsutil to find the right files
# refer: https://github.com/shirou/gopsutil#usage
ENV HOST_PROC /host/proc
ENV HOST_SYS /host/sys
ENV HOST_ETC /host/etc
ENV HOST_VAR /host/var
ENV HOST_RUN /host/run
ENV HOST_DEV /host/dev

ENTRYPOINT ["grofer"]
