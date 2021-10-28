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

If you want to remove repos, remove the repo as follows:

    helm repo remove <alias>

To install the <chart-name> chart:

    helm install my-<chart-name> <alias>/<chart-name> -n <namespace>

To install the <chart-name> chart:

    helm upgrade my-<chart-name> <alias>/<chart-name> -n <namespace>

  To uninstall the chart:

    helm uninstall my-<chart-name> -n <namespace>
    
 ## Contribute to exsisting charts or add chart.
    
   1. git clone swift-helm-charts repo.
   2. create a branch from the main branch.
   3. Add/configure the new charts.
   4. Push your changes to git and create a pull request. Once the pull request is created the CI.yaml github action will run the tests on the charts.
   5. Once the pull request is merged to main release.yaml will release the new version of the swift-helm-charts.
