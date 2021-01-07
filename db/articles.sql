CREATE DATABASE IF NOT EXISTS test CHARACTER SET utf8;
CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost';


USE test;

CREATE TABLE IF NOT EXISTS articles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    content TEXT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO articles (title, author, content) VALUES
("Docker Compose", 'Issaoui Bilel', "Docker Compose est un outil développé par Docker pour créer les architectures logicielles containérisées. Dans cette logique, chaque brique de l'application (code, base de données, serveur web...) sera hébergée par un container. Cet outil repose sur le langage YAML (pour Yet Another Markup Language) pour décrire l'architecture. Une fois celle-ci codée dans un fichier YAML, l'ensemble des services applicatifs seront générés via une commande unique. "),
("Docker Swarm et Kubernetes", 'Issaoui Bilel', "Pour faciliter le management des architectures complexes, Docker à construit une plateforme de Containers-as-a-Service. Baptisée Docker Enterprise, elle a été cédé à Mirantis en novembre 2019. Elle comprend les principaux outils nécessaires pour gérer le déploiement, le pilotage, la sécurité et le monitoring de tels environnements. Côté gestion de cluster, Docker Entreprise intègre à la fois Swarm, son moteur d'orchestration maison, mais aussi Kubernetes, qui s'est imposé comme un standard dans la management de cluster. Désormais, la société de San Francisco entent proposer une plateforme capable de gérer de manière fédérée des applications qu'elles soient basées sur les grands services cloud de Kurbenetes managé ou sur des clouds Swarm.Dans sa dernière version (Docker Enterprise 3.0), la plateforme Docker introduit une distribution Kubernetes certifiée (baptisée Docker Kubernetes Service) mais aussi des outils d'automatisation du cycle de vie des déploiements. Enfin, Docker Enterprise s'accompagne de Docker Application, un nouveau format visant à faciliter la création d'applications dockérisées et distribuées. "),
("L'unikernel est-ce la même chose qu'un container ?", 'Issaoui Bilel', "Non. L'unikernel se situe à mi-chemin entre la virtualisation serveur classique et le container. Alors que la virtualisation traditionnelle reprend l'intégralité de l'OS serveur dans la machine virtuelle, l'unikernel n'embarque, lui, dans la VM que les librairies du système nécessaires à l'exécution de l'application qu'elle contient. Le noyau de l'OS restant lui en dehors de la machine. A la différence du container Docker, l'unikernel reprend donc une partie de l'OS dans la VM.")
