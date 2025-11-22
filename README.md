Tri-Demo

Contents:
demos/love
demos/libertas
demos/cra
web-ui
docker-compose.yml
Quick start:
Build all images:
Code
Copy Code
docker-compose build
Run UI and demo containers:
Code
Copy Code
docker-compose up --detach
Open the UI:
Code
Copy Code
http://localhost:3000
Run individual demos:
Love:
Code
Copy Code
docker build -t tri_demo_love ./demos/love && docker run --rm tri_demo_love
Libertas:
Code
Copy Code
docker build -t tri_demo_libertas ./demos/libertas && docker run --rm tri_demo_libertas
CRA:
Code
Copy Code
docker build -t tri_demo_cra ./demos/cra && docker run --rm -it tri_demo_cra
License: MIT (see LICENSE file)
