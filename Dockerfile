# Use a lightweight Python image (you could also use `alpine` with a simple HTTP server)
FROM python:3.9-alpine

# Create a simple HTTP server that responds with "Hello World"
RUN echo 'from http.server import BaseHTTPRequestHandler, HTTPServer' > server.py && \
    echo 'class Handler(BaseHTTPRequestHandler):' >> server.py && \
    echo '    def do_GET(self):' >> server.py && \
    echo '        self.send_response(200)' >> server.py && \
    echo '        self.send_header("Content-type", "text/plain")' >> server.py && \
    echo '        self.end_headers()' >> server.py && \
    echo '        self.wfile.write(b"Hello World!")' >> server.py && \
    echo 'server = HTTPServer(("0.0.0.0", 8080), Handler)' >> server.py && \
    echo 'print("Server running on port 8080...")' >> server.py && \
    echo 'server.serve_forever()' >> server.py

# Expose port 8080
EXPOSE 8080

# Run the server
CMD ["python", "server.py"]
