{{/*
Expand the name of the chart.
*/}}
{{- define "mmkubeapps.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mmkubeapps.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mmkubeapps.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "mmkubeapps.releaseRevision" -}}
{{ .Release.Revision }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mmkubeapps.labels" -}}
helm.sh/chart: {{ include "mmkubeapps.chart" . }}
{{ include "mmkubeapps.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mmkubeapps.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mmkubeapps.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{/*
SecretManager labels
*/}}
{{- define "mmkubeapps.secretsManagerLabels" -}}
aws.secrets-manager/enabled: "true"
{{ include "mmkubeapps.selectorLabels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "mmkubeapps.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "mmkubeapps.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
