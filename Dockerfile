FROM golang:latest as builder
WORKDIR /go/src/github.com/tnozicka/gohellouniverse/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo 

FROM scratch  
WORKDIR /opt/bin
COPY --from=builder /go/src/github.com/tnozicka/gohellouniverse/gohellouniverse .
CMD ["./gohellouniverse"] 
USER 1001
