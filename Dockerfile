# ---------- Build stage ----------
FROM golang:1.23-alpine AS builder

RUN apk add --no-cache git
WORKDIR /build
ENV GOTOOLCHAIN=auto

# Fetch & build the plugin
RUN go install github.com/awslabs/tc-redirect-tap/cmd/tc-redirect-tap@latest

# ---------- Minimal final stage ----------
FROM scratch
COPY --from=builder /go/bin/tc-redirect-tap /tc-redirect-tap

# Add a dummy command so "docker create" won't fail
CMD ["/tc-redirect-tap"]
