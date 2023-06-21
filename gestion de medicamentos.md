# gestion de medicamentos
## glosario 

- **PK**: _Primari Key_
- **FK**: _Forein Key_
- **UQ**: _Unique Atribute_
- **ED**: Entidad de datos
- **EP**: Entidad pivote
- **EC**: entidad de catalogo

## entidades
### **paciente  ED** 
- id_paciente **PK**
- nombre(s)
- apellido paterno
- apellido materno
- numero_de_seguridad_social **UQ**
- fecha_de_nacimiento
- id_direccion
### **direccion**
- id_direccion **PK**
- calle
- cp
- pais
### **servicio ED** 
- id_servicio **PK**
- tipo_de_servicio 
- diagnostico
- fecha_ingreso
- fecha_alta
- id_paciente **FK**
- id_facultativo **FK**
- notas
- id_consumo_ser **FK**
### **farmaco EC** 
- id_farmaco **PK**
- nombre_comercial
- nombre_clinico
- compuesto_quimico
- ubicacion
- id_proveedor **FK**
- numero_de_dosis_por_envase
- precio_de_dosis
- precio_por_envase
### **medicacion EP**
- id_medicacion **PK**
- id_farmacos **FK**
- id_servicio **FK**
- cantidad
- id_facultativos **FK**
- fecha_entrega
### **facultativos EP**
- id_facultativo **PK**
- nombre
- id_direccion **FK**
### **proveedor EC**
- nombre_proveedor
- telefono
- id_direccion
- reputacion
### **consumible EC**
- id_consumible **PK**
- costo
- id_proveedor **FK**