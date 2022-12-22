
{{/*
Chart name and version
*/}}
{{- define "preview-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels  
*/}}
{{- define "preview-chart.labels" -}}
helm.sh/chart: {{ include "preview-chart.chart" . }}
{{ include "preview-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels   
*/}}
{{- define "preview-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ .Release.Name }}
tags.datadoghq.com/env: {{ .Values.environment }}
env: {{ .Values.environment }}
{{- end }}