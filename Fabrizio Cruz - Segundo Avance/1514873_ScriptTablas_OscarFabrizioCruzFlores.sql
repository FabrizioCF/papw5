Create schema if not exists axiom;

use axiom;

create table if not exists
Usuario(
		idUsuario		int not null auto_increment,
		nombreUsuario	varchar(50)  not null,
        apellidoUsuario	varchar(50)  not null,
        correo			varchar(30) not null unique,
        contrasena		varchar(50) not null,
        imagenPerfil	mediumblob not null,
        direccion 		varchar(200),
        telefono 		varchar(10),
        activo			tinyint(1),
        
        primary key (idUsuario)
);

create table if not exists
Articulo(
		idArticulo 		int not null auto_increment,
		nombreArticulo 	varchar(50) not null,
        descripcion		text not null,
        precio 			double not null,
        unidades		int,
        descuento		double,
        img1			blob not null,
        img2			blob not null,
        img3			blob not null,
        Video			mediumblob not null,
        valoracion		double,
        visitas			int,
        publicado		TINYINT(1),
        activo			TINYINT(1),
        fechaPublica	timestamp,
        idUsuario		int not null,
        caracteristicas text,
        especificaciones text,
        
        foreign key (idUsuario) references Usuario(idUsuario),
        primary key (idArticulo)
);

create table if not exists
Categoria(
		idCategoria 	int not null auto_increment,
		nombreCat		varchar(50) not null,
		primary key (idCategoria)
);

create table if not exists
MetodoPago(
		idMetodoPago	int not null auto_increment,
		nombreMetPag	varchar(50) not null,
        primary key (idMetodoPago)
);

create table if not exists
CompraArticulo(
		 idCompra		int not null auto_increment,
		 idUsuario	 	int not null,
		 idArticulo		int not null,
         precioArticulo double not null,
         cantidad 		int,
         fechaCompra	timestamp,
         valoracion		int,
         
         foreign key (idUsuario) references Usuario(idUsuario),
         foreign key (idArticulo) references Articulo(idArticulo),
         primary key (idCompra)
);

create table if not exists
Carrito(
		 idCarrito		int not null auto_increment,
		 idUsuario	 	int not null,
		 idArticulo		int not null,
         cantidad 		int,
         
         foreign key (idUsuario) references Usuario(idUsuario),
         foreign key (idArticulo) references Articulo(idArticulo),
         primary key (idCarrito)
);

create table if not exists
ComentaArticulo(
		 idComentario	int not null auto_increment,
		 idUsuario	 	int not null,
		 idArticulo		int not null,
         titulo 		varchar(100) not null,
         cuerpo			text not null,
         fechaComent	timestamp,
         valoracion		int,
         
         foreign key (idUsuario) references Usuario(idUsuario),
         foreign key (idArticulo) references Articulo(idArticulo),
         primary key (idComentario)
);

create table if not exists
ArtiCat(
		idArtiCat		int not null auto_increment,
		idCategoria 	int not null,
		idArticulo		int not null,
         
        foreign key (idCategoria) references Categoria(idCategoria),
        foreign key (idArticulo) references Articulo(idArticulo),
        primary key (idArtiCat)
);

create table if not exists
FormaPago(
		idFormaPago		int not null auto_increment,
		idMetodoPago 	int not null,
		idArticulo		int not null,
         
        foreign key (idMetodoPago) references MetodoPago(idMetodoPago),
        foreign key (idArticulo) references Articulo(idArticulo),
        primary key (idFormaPago)
);