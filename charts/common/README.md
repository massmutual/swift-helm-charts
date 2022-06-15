# Common Library Chart

A [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm) for grouping common logic between charts.

## TL;DR

```yaml
dependencies:
  - name: common
    version: 1.x.x
    repository: https://charts.bitnami.com/bitnami
```

```bash
$ helm dependency update
```