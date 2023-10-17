from django.db import models
from abogado.models import Abogado,Contratista
from informacionPAAetapaPrevia.models import InformacionPaaEInsumosEtapaPrevia

class EstadoProceso(models.Model):
    id = models.IntegerField(primary_key=True)
    estado_proceso = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'estado_proceso'

class LiberacionDeSaldosCdp(models.Model):
    valor = models.IntegerField(db_column='Valor')  # Field name made lowercase.
    no_radicado = models.IntegerField(db_column='No_Radicado')  # Field name made lowercase.
    fecha_radicado = models.DateField(db_column='Fecha_Radicado')  # Field name made lowercase.
    proceso_numero_contrato = models.ForeignKey('Proceso', models.DO_NOTHING, db_column='proceso_numero_contrato')

    class Meta:
        managed = False
        db_table = 'liberacion_de_saldos_cdp'

class Pagos(models.Model):
    proceso_numero_contrato = models.ForeignKey('Proceso', models.DO_NOTHING, db_column='proceso_numero_contrato')
    fecha = models.DateField()
    valor = models.FloatField()
    pago_pac_mes_programado = models.CharField(db_column='pago-PAC_mes-programado', max_length=45)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    mes_cuenta = models.CharField(max_length=45)
    restantes = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'pagos'


class Proceso(models.Model):
    numero_contrato = models.AutoField(primary_key=True)
    ultima_actualizacion = models.DateField()
    observaciones = models.CharField(max_length=45)
    cantidad_contratos = models.CharField(max_length=2)
    estado_proceso = models.ForeignKey(EstadoProceso, models.DO_NOTHING)
    relacion_linea_paa = models.CharField(db_column='relacion_linea_PAA', max_length=45)  # Field name made lowercase.
    contingencia = models.IntegerField()
    equipo_otic = models.CharField(db_column='equipo_OTIC', max_length=80)  # Field name made lowercase.
    proyecto_o_sistema = models.CharField(db_column='proyecto_ o_sistema', max_length=200)  # Field renamed to remove unsuitable characters.
    rol = models.CharField(max_length=80)
    priorizado = models.IntegerField()
    abogado = models.ForeignKey(Abogado, models.DO_NOTHING)
    contratista_cedula_contratista = models.ForeignKey(Contratista, models.DO_NOTHING, db_column='contratista_cedula_contratista')
    linea_paa = models.ForeignKey(InformacionPaaEInsumosEtapaPrevia, models.DO_NOTHING, db_column='linea_PAA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'proceso'

