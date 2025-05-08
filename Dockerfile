# ---------- Build stage ----------
FROM golang:1.23-alpine AS builder

RUN apk add --no-cache git
WORKDIR /build
ENV GOTOOLCHAIN=auto

# Clone the repository
RUN git clone https://github.com/awslabs/tc-redirect-tap.git .

# Build the binary
RUN go build -o /go/bin/tc-redirect-tap ./cmd/tc-redirect-tap

# ---------- Minimal final stage ----------
FROM scratch
COPY --from=builder /go/bin/tc-redirect-tap /tc-redirect-tap

# Add a dummy command so "docker create" won't fail
CMD ["/tc-redirect-tap"]
