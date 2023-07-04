FROM ubuntu:22.04 as builder

RUN apt update -y && apt install -y gcc curl
RUN curl -L --output close_range.c https://gist.githubusercontent.com/dylrich/0320239181c24a2470e7dfb5b1f7a7bd/raw/2b76c9a0a13fc36f43f7b56e78e11c1d809d68d4/close_range.c
RUN gcc close_range.c -o /close_range

FROM ubuntu:22.04
COPY --from=builder /close_range /
CMD [ "/close_range" ]
