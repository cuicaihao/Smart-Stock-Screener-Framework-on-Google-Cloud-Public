from diagrams import Cluster, Diagram, Edge
from diagrams.gcp.storage import GCS

from diagrams.gcp.devtools import SourceRepositories
from diagrams.gcp.devtools import Build
from diagrams.gcp.devtools import ContainerRegistry
from diagrams.gcp.devtools import Scheduler
from diagrams.gcp.devtools import Code
from diagrams.gcp.compute import Run

from diagrams.gcp.security import KeyManagementService

from diagrams.onprem.compute import Server
from diagrams.onprem.client import Client
from diagrams.onprem.client import User
from diagrams.onprem.client import Users

from diagrams.programming.language import Python


with Diagram("system_diagram", show=False):
    github = SourceRepositories("GitHub")
    developer = User("Developer")
    data_source = Server("Stock Database")
    client_end = Client("Client")
    users = Users("Users")

    with Cluster("Local Development"):
        code = Code("VSCode")
        python = Python("Python")
        developer >> code >> github

    with Cluster("GCP"):
        cloud_build = Build("Cloud Build")
        container_registry = ContainerRegistry("Container Registry")
        cloud_scheduler = Scheduler("Cloud Scheduler")
        cloud_run = Run("Cloud Run")
        cloud_build >> container_registry >> cloud_scheduler >> cloud_run

        with Cluster("Data Lake"):
            bigquery = BigQuery("BigQuery")
            gcs = GCS("GCS")
            bigquery << Edge() >> gcs
            cloud_run >> bigquery

        KeyManagementService("secret manager") >> Edge(label="token") >> cloud_run

    data_source >> Edge(label="ELT") >> cloud_run
    github >> cloud_build
    client_end >> users
    bigquery >> client_end
