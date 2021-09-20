# swift-helm-charts
Used for helm charts packaging 

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add <alias> https://massmutual.github.io/swift-helm-charts
  
If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
<alias>` to see the charts.

To install the <chart-name> chart:

    helm install my-<chart-name> <alias>/<chart-name>

To install the <chart-name> chart:

    helm upgrade my-<chart-name> <alias>/<chart-name>

  To uninstall the chart:

    helm delete my-<chart-name>
