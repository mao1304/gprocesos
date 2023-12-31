# Generated by Django 4.2.6 on 2023-10-17 02:42

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Abogado',
            fields=[
                ('id_abogado', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre_abogado', models.CharField(max_length=48)),
            ],
            options={
                'db_table': 'abogado',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Contratista',
            fields=[
                ('cedula_contratista', models.BigIntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=45)),
                ('area_solicitante', models.CharField(max_length=45)),
                ('telefono', models.BigIntegerField()),
                ('hoja_de_vida', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'contratista',
                'managed': False,
            },
        ),
    ]
