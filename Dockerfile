# Use a lightweight Python image (you could also use `alpine` with a simple HTTP server)
   2   │ FROM python:3.9-alpine
   3   │
   4   │ # Create a simple HTTP server that responds with "Hello World"
   5   │ RUN echo 'from http.server import BaseHTTPRequestHandler, HTTPServer' > server.py && \
   6   │     echo 'class Handler(BaseHTTPRequestHandler):' >> server.py && \
   7   │     echo '    def do_GET(self):' >> server.py && \
   8   │     echo '        self.send_response(200)' >> server.py && \
   9   │     echo '        self.send_header("Content-type", "text/plain")' >> server.py && \
  10   │     echo '        self.end_headers()' >> server.py && \
  11   │     echo '        self.wfile.write(b"Hello World!")' >> server.py && \
  12   │     echo 'server = HTTPServer(("0.0.0.0", 8080), Handler)' >> server.py && \
  13   │     echo 'print("Server running on port 8080...")' >> server.py && \
  14   │     echo 'server.serve_forever()' >> server.py
  15   │
  16   │ # Expose port 8080
  17   │ EXPOSE 8080
  18   │
  19   │ # Run the server
  20   │ CMD ["python", "server.py"]
