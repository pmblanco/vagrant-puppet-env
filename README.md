# Vagrant para desarrollo de puppet

## Introducci�n
La intenci�n de este vagrant es la de desplegar en poco tiempo un entorno de puppet + puppetdb, donde poder realizar el desarrollo de nuevos m�dulos de puppet, teniendo disponible la opci�n de usar los "exported resources".
A ra�z de esta repositorio se pueden hacer nuevos �forks�, para a�adir m�s m�quinas a nuestro entorno, o jugar con lo que sea necesario.
Esta versi�n est� basada en Ubuntu Precise, pero en futuras versiones los m�dulos de puppet ser�n compatibles con Centos

## Componentes
Esta versi�n inicial consta de dos m�quinas
- puppet1 (192.168.5.15)
- dashboard1 (192.168.5.16)

Los servicios de puppetmaster y de puppetdb est�n contenidos en la primera m�quina. En la segunda est� instalado el servicio puppetboard, que se puede consultar con la URL: http://192.168.5.16

## Autores

Pedro Miguel Blanco 
   
## Changelog

### v.0.2. 30/03/2014
Se puede consultar puppetboard en el servidor dashboard1 (http://192.168.5.16)

### v.0.1. 28/03/2014
