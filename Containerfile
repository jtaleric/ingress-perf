FROM registry.access.redhat.com/ubi8/ubi:latest as builder
RUN dnf install -y make git unzip gcc
RUN git clone https://github.com/wg/wrk.git --depth=1
RUN cd wrk && make -j $(nproc)

FROM registry.access.redhat.com/ubi8/ubi:latest
COPY --from=builder /wrk/wrk /usr/bin/wrk
COPY json.lua json.lua
