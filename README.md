[![azure](https://img.shields.io/badge/azure-%230072C6.svg?style=flat-square&logo=microsoftazure&logoColor=white)](https://learn.microsoft.com/en-us/cli/azure/run-azure-cli-docker)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat-square&logo=docker&logoColor=white)](https://hub.docker.com/_/microsoft-azure-cli/)
![GitHub last commit](https://img.shields.io/github/last-commit/hubertronald/AzureCLI?style=flat-square)
[![MIT](https://img.shields.io/github/license/hubertronald/AzureCLI?style=flat-square)](LICENSE)


# AzureCLI
Este repositorio permite correr en un ambiente local el [Azure CLI]((https://learn.microsoft.com/en-us/cli/azure/run-azure-cli-docker)), con **docker compose**. La motivación principal fue que en la documentación oficial, solo se proporciona el siguiente ejemplo para arracar el contenedor:

```bash
docker run -it mcr.microsoft.com/azure-cli:<version>
```

Esto implica que las extensiones como por ejemplo `datafactory`,`databricks` entre otras, tienen que ser instaladas manualmente.

Adicional a ello la información generada en el contenedor anterior al no poseer un volumen se perdería al detenerlo.


# Inicio

1. Una vez se clone el proyecto

    ```bash
    git clone https://github.com/HubertRonald/AzureCLI.git
    ``` 

2. Luego habilita los siguientes scripts de bash para que puedan ser ejecutados:

    ```bash
    chmod +x start.sh stop.sh destroy.sh
    ```

3. Asegurase de tener **[Docker Desktop](https://www.docker.com/products/docker-desktop/)** encendido

4. Se puede iniciar rápidamente desde la terminal con:

    ```bash
    ./start.sh
    ```


5. Para finalizar el proceso, en la terminal correr:

    ```bash
    ./stop.sh
    ```


6. Para destruir el servicio y el contenedor (también), sin eliminar los archivos en la carpeta `data`:

    ```bash
    ./destroy.sh
    ```

# Agregar Servicios (Extensiones)
En el archivo [.env](.env#1) se encuentra la variable `EXTENSIONS` que viene configurada con algunos servicios por defecto.

Si se requiere agregar el servicio `kusto` por ejemplo, solo se adiciona en la misma linea y separado por coma (`,`):

```bash
EXTENSIONS="datafactory,databricks,powerbidedicated,kusto"
```

Al lanzar nuevamente el servicio `./start.sh` corriendo el siguiente comando:

```bash
az extension list
```

Que se describe en [Use and manage extensions with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview) se evidencia su instalación:
```bash
[
  {
    "experimental": true,
    "extensionType": "whl",
    "name": "kusto",
    "path": "/root/.azure/cliextensions/kusto",
    "preview": false,
    "version": "0.1.1"
  },
  {
    "experimental": false,
    "extensionType": "whl",
    "name": "databricks",
    "path": "/root/.azure/cliextensions/databricks",
    "preview": false,
    "version": "0.8.0"
  },
  {
    "experimental": true,
    "extensionType": "whl",
    "name": "datafactory",
    "path": "/root/.azure/cliextensions/datafactory",
    "preview": false,
    "version": "0.1.0"
  }
]
```

> Nota: tengase en cuenta que al ser objeto json la respuesta los servicios pueden que no salgan en el mismo orden cuando se lance el comando `az extension list`. Adicionalmente para ver todos los servicios de azure disponibles en el cli, se ejecuta el siguiente comando az `extension list-available`.


# Administración de Servicos

Una vez levantado el servicio [azcli](docker-compose.yml#3) en docker se recomienda ver 
[How to manage Azure subscriptions with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/manage-azure-subscriptions-azure-cli)

En resumen, para lograr lo anterior, basta correr cualquiera de los dos comandos (dependiendo si es personal o corporativa la cuenta) para ingresar desde el servicio de docker [azcli](docker-compose.yml#3)

```bash
# ingresar con un usuario diferente
az login --user <miUsuario@miEmpresa.com> -password <miClave>

# ingresar con un Tenant diferente
az login --tenant <miTenantID>
```

> Nota: Para las cuentas con doble autenticación en la terminal te dará un código que deberas ingresar en el explorador que tengas el portal ya abierto.


# .gitignore

Fue generado en [gitignore.io](https://www.toptal.com/developers/gitignore/) con los filtros `macos`, `windows` y consumido mediante su API como archivo crudo desde la terminal:

```bash
curl -L https://www.toptal.com/developers/gitignore/api/macos,windows > .gitignore
```


# Autores
* **Hubert Ronald** - *Trabajo Inicial* - [HubertRonald / AzureCLI](https://github.com/HubertRonald/AzureCLI)

Ve también la lista de [contribuyentes](https://github.com/HubertRonald/AzureCLI/contributors) que participaron en este proyecto.


# Licencia
Este proyecto está bajo licencia MIT - ver la [LICENCIA](LICENSE) archivo (en inglés) con más detalles