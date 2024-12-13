{{- define "regexMatch" -}}
{{- $pattern := index . 0 -}}
{{- $value := index . 1 -}}
{{- if regexMatch $pattern $value -}}
true
{{- else -}}
false
{{- end -}}
{{- end -}}
