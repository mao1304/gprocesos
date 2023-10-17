# Generated by Django 4.2.6 on 2023-10-17 02:42

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='EstadoProceso',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('estado_proceso', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'estado_proceso',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='LiberacionDeSaldosCdp',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor', models.IntegerField(db_column='Valor')),
                ('no_radicado', models.IntegerField(db_column='No_Radicado')),
                ('fecha_radicado', models.DateField(db_column='Fecha_Radicado')),
            ],
            options={
                'db_table': 'liberacion_de_saldos_cdp',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pagos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('valor', models.FloatField()),
                ('pago_pac_mes_programado', models.CharField(db_column='pago-PAC_mes-programado', max_length=45)),
                ('mes_cuenta', models.CharField(max_length=45)),
                ('restantes', models.IntegerField()),
            ],
            options={
                'db_table': 'pagos',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Proceso',
            fields=[
                ('numero_contrato', models.AutoField(primary_key=True, serialize=False)),
                ('ultima_actualizacion', models.DateField()),
                ('observaciones', models.CharField(max_length=45)),
                ('cantidad_contratos', models.CharField(max_length=2)),
                ('relacion_linea_paa', models.CharField(db_column='relacion_linea_PAA', max_length=45)),
                ('contingencia', models.IntegerField()),
                ('equipo_otic', models.CharField(db_column='equipo_OTIC', max_length=80)),
                ('proyecto_o_sistema', models.CharField(db_column='proyecto_ o_sistema', max_length=200)),
                ('rol', models.CharField(max_length=80)),
                ('priorizado', models.IntegerField()),
            ],
            options={
                'db_table': 'proceso',
                'managed': False,
            },
        ),
    ]