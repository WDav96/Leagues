# Leagues
Fetch data from The Sports DB API

#### Funcionalidades técnicas:
- Las vistas están desarolladas programáticamente.
- La arquitectura de la aplicación es MVVM extendido.
- La aplicación no utiliza librerías de terceros.
- La aplicación usa una capa genérica y extensible con URLSession para hacer el llamado de los servicios.  
- La aplicación usa Codable para el mapeo de JSON a objetos.
- Los enlaces de la aplicación se implementan con cierres.
#### Funcionalidades generales:
- La pantalla principal consta de un listado de ligas obtenidas de la API The Sports DB .
- Cuando se selecciona una liga se direcciona a los equipos de esta.
- Cuando se selecciona un equipo se direcciona al detalle de este.
#### Arquitectura:
Se implementó MVVM como arquitectura, con las siguientes capas:
1) Model: Contiene las entidades.
2) View: Contiene las vistas y su lógica.
3) ViewModel: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Manager: Se encarga de la obtención de los datos.
5) Router: Contiene la navegación entre controladores.
6) Factory: Construye objetos complejos.
