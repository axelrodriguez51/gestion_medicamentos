/*
comenzaremos creando las tablas de la base de datos de nuestro proyecto postgresql
*/
create table paciente (
    id_paciente serial primary key,
    nombre varchar(50) not null,
    apellido_materno varchar(50) not null,
    apellido_paterno varchar(50) not null,
    numero_de_seguro varchar(10) not null,
    edad int not null,
    sexo varchar(1) not null,
    telefono varchar(10) not null,
    email varchar(50) not null,
    fecha_nacimiento date not null
);
create table facultativos (
    id_facultativo serial primary key,
    nombres varchar(50) not null,
    apellido_materno varchar(50) not null,
    apellido_paterno varchar(50) not null,
    especialidad varchar(50) not null,
    telefono varchar(10) not null,
    email varchar(50) not null,
    id_direccion int not null,
    foreign key (id_direccion) references direccion(id_direccion)
);
create table direccion (
    id_direccion serial primary key,
    calle varchar(50) not null,
    numero_exterior varchar(10) not null,
    numero_interior varchar(10) not null,
    colonia varchar(50) not null,
    municipio varchar(50) not null,
    estado varchar(50) not null,
    codigo_postal varchar(10) not null
);
create table proveedor (
    id_proveedor serial primary key,
    nombre varchar(50) not null,
    telefono varchar(10) not null,
    email varchar(50) not null,
    id_direccion int not null,
    reputacion varchar(50) not null,
    foreign key (id_direccion) references direccion(id_direccion)
);
create table medicamento (
    id_medicamento serial primary key,
    nombre_comercial varchar(50) not null,
    nombre_clinico varchar(50) not null,
    compuesto_activo varchar(50) not null,
    precio float not null,
    cantidad int not null,
    id_proveedor int not null,
    foreign key (id_proveedor) references proveedor(id_proveedor)
);
create table medicacion (
    id_medicacion serial primary key,
    id_servicio int not null,
    id_medicamento int not null,
    id_facultativo int not null,
    fecha_de_entrega date not null,
    cantidad int not null,
    foreign key (id_medicamento) references medicamento(id_medicamento),
    foreign key (id_facultativo) references facultativos(id_facultativo)
    foreign key (id_servicio) references servicio(id_servicio)
);
create table consumibles (
    id_consumible serial primary key,
    nombre_consumible varchar(50) not null,
    precio float not null,
    cantidad_consumida int not null,
    cantidad_por_envase int not null,
    id_proveedor int not null,
    foreign key (id_proveedor) references proveedor(id_proveedor)
);
create table consumo_servicio (
    id_consumo_servicio serial primary key,
    id_consumible int not null,
    foreign key (id_consumible) references consumibles(id_consumible)
);