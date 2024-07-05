
NAME = Inception
SRCDIR = ./srcs/

DBFLD = mariadb/
DBIMGNAME = mariadb
DBDOCKER = mariadb
DBDIR = $(addprefix $(SRCDIR), $(DBFLD))

DBDOCKERFILE = $(addprefix $(DBDIR), $(BDOCKER))
DBIMGSRC = $(addprefix $(DBDIR), $(DBIMGNAME))

db: 
	docker build --file srcs/mariadb/mariadb.Dockerfile -t mariadb:latest srcs/mariadb
	docker run mariadb:latest

clean: $(DBIMGSRC)
	rm -rf $(DBIMGSRC)
