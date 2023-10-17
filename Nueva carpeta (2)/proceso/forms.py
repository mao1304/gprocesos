from django import forms

class ProcesoForm(forms.Form):
    numero_contrato = forms.IntegerField()
    ultima_actualizacion = forms.DateField()
    observaciones = forms.CharField(max_length=45)
    cantidad_contratos = forms.CharField(max_length=2)
    estado_proceso_id = forms.IntegerField()
    relacion_linea_PAA = forms.CharField(max_length=45)
    contingencia = forms.BooleanField()
    equipo_OTIC = forms.CharField(max_length=80)
    proyecto_o_sistema = forms.CharField(max_length=200)
    rol = forms.CharField(max_length=80)
    priorizado = forms.BooleanField()
    abogado_id = forms.IntegerField()
    contratista_cedula_contratista = forms.IntegerField()
    linea_PAA = forms.CharField(max_length=45)