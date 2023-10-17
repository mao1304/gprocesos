from django.db import models

class Abogado(models.Model):
    id_abogado = models.IntegerField(primary_key=True)
    nombre_abogado = models.CharField(max_length=48)

    class Meta:
        managed = False
        db_table = 'abogado'


class Contratista(models.Model):
    cedula_contratista = models.BigIntegerField(primary_key=True)
    nombre = models.CharField(max_length=45)
    area_solicitante = models.CharField(max_length=45)
    telefono = models.BigIntegerField()
    hoja_de_vida = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'contratista'

