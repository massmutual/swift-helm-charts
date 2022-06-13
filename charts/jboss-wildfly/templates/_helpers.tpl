{{/*
Expand the name of the chart.
*/}}
{{- define "jboss-wildfly.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jboss-wildfly.fullname" -}}
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
{{- define "jboss-wildfly.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "jboss-wildfly.releaseRevision" -}}
{{ .Release.Revision }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jboss-wildfly.labels" -}}
helm.sh/chart: {{ include "jboss-wildfly.chart" . }}
{{ include "jboss-wildfly.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jboss-wildfly.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jboss-wildfly.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{/*
SecretManager labels
*/}}
{{- define "jboss-wildfly.secretsManagerLabels" -}}
aws.secrets-manager/enabled: "true"
{{ include "jboss-wildfly.selectorLabels" . }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "jboss-wildfly.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "jboss-wildfly.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
