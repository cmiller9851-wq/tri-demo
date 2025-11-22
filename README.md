Tri-Demo

Contents: demos/love demos/libertas demos/cra web-ui docker-compose.yml

Quick start:
Build all images:
docker-compose build

Run UI and demo containers:
docker-compose up --detach

Open the UI:
http://localhost:3000

Run individual demos:
Love:
docker build -t tri_demo_love ./demos/love && docker run --rm tri_demo_love

Libertas:
docker build -t tri_demo_libertas ./demos/libertas && docker run --rm tri_demo_libertas

CRA:
docker build -t tri_demo_cra ./demos/cra && docker run --rm -it tri_demo_cra

License: MIT (see LICENSE file)
CI test: trigger
