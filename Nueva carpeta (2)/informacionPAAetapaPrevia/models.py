from django.db import models

class Cdp(models.Model):
    no = models.IntegerField()
    obs_estado = models.CharField(max_length=45)
    justificacion = models.CharField(max_length=80)
    solicitud_cdp_memorando_no_radicado = models.BigIntegerField(db_column='solicitud_cdp_memorando_No_radicado')  # Field name made lowercase.
    solicitud_cdp_fecha_radicado = models.DateField()
    fecha_cdp = models.DateField()
    valor_cdp = models.FloatField()
    valor_cdp_vf_diciembre_2023 = models.IntegerField(db_column='valor_cdp_VF_diciembre_2023')  # Field name made lowercase.
    cdp_entregado_a = models.CharField(max_length=45)
    linea_paa = models.ForeignKey('InformacionPaaEInsumosEtapaPrevia', models.DO_NOTHING, db_column='linea_PAA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cdp'

class Datos(models.Model):
    id_datos = models.IntegerField(primary_key=True)
    codigo_bpin = models.IntegerField(db_column='codigo_BPIN')  # Field name made lowercase.
    nombre_proyecto_de_inversion = models.CharField(max_length=45)
    codigo_ccp = models.CharField(db_column='codigo_CCP', max_length=45)  # Field name made lowercase.
    objetivo_especifico = models.CharField(max_length=80)
    descripcion_codigo_ccp = models.CharField(db_column='descripcion_codigo_CCP', max_length=45)  # Field name made lowercase.
    uso_presupuestal = models.CharField(max_length=60)
    recurso = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'datos'
    
class InformacionPaaEInsumosEtapaPrevia(models.Model):
    linea_paa = models.CharField(db_column='linea_PAA', primary_key=True, max_length=45)  # Field name made lowercase.
    objetivo_2023 = models.CharField(max_length=200)
    oblligaciones = models.TextField()
    objetivo_2024 = models.TextField(blank=True, null=True)
    metas_proyecto = models.ForeignKey('MetasProyecto', models.DO_NOTHING, db_column='metas_proyecto_ID')  # Field name made lowercase.
    plan_accion_codigo = models.ForeignKey('PlanAccion', models.DO_NOTHING, db_column='plan_accion_codigo')
    vifencia_futura = models.CharField(max_length=16)
    codigo_unspsc = models.CharField(db_column='codigo_UNSPSC', max_length=45)  # Field name made lowercase.
    plazo_meses = models.IntegerField()
    plazo_dias = models.IntegerField(blank=True, null=True)
    mes_inicio = models.CharField(max_length=45)
    fecha_inicio_programada = models.DateField()
    fecha_inicio_programada_copy1 = models.DateField()
    valor_honorario_mes = models.IntegerField()
    iva = models.IntegerField()
    valor_honorario_iva = models.IntegerField(blank=True, null=True)
    valor_honorario_2024 = models.IntegerField(blank=True, null=True)
    valor_estimado_2023_2024 = models.IntegerField(db_column='valor_estimado_2023-2024', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    valor_aprobado_plan_anual_de_adquiciciones_1_semestre_2023 = models.IntegerField(blank=True, null=True)
    valor_aprobado_plan_anual_de_adquiciciones_24_07_2023 = models.IntegerField(db_column='valor_aprobado_plan_anual_de_adquiciciones_24-07-2023', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    datos_id_datos = models.ForeignKey(Datos, models.DO_NOTHING, db_column='datos_id_datos')

    class Meta:
        managed = False
        db_table = 'informacion_paa_e_insumos_etapa_previa'

class LegalizacionContratos(models.Model):
    valor_contrato = models.FloatField()
    valor_mes = models.FloatField()
    plazo_mes = models.DecimalField(max_digits=10, decimal_places=0)
    plazo_dias = models.IntegerField(blank=True, null=True)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    nuevo_supervisor = models.CharField(max_length=45, blank=True, null=True)
    no_proceso_secop_ii = models.CharField(db_column='No_Proceso_SECOP_II', max_length=45, blank=True, null=True)  # Field name made lowercase.
    linea_paa = models.ForeignKey(InformacionPaaEInsumosEtapaPrevia, models.DO_NOTHING, db_column='linea_PAA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'legalizacion_contratos'
        
        
class MetasProyecto(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    metas_proyecto_descripcion = models.TextField()

    class Meta:
        managed = False
        db_table = 'metas_proyecto'
        
class PlanAccion(models.Model):
    codigo = models.CharField(primary_key=True, max_length=8)
    actividad = models.TextField()

    class Meta:
        managed = False
        db_table = 'plan_accion'
class ProyeccionSegundosContratosPaa(models.Model):
    fecha_inicio = models.CharField(max_length=24, blank=True, null=True)
    duracion_meses = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)
    valor_mes = models.IntegerField(blank=True, null=True)
    proyeccion_18_dic_2023 = models.FloatField(blank=True, null=True)
    linea_paa = models.ForeignKey(InformacionPaaEInsumosEtapaPrevia, models.DO_NOTHING, db_column='linea_PAA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'proyeccion_segundos_contratos_paa'
        

