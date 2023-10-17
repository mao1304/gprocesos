
from django.shortcuts import render
from .forms import ProcesoForm

def proceso_view(request):
    form = ProcesoForm()
    return render(request, 'proceso.html', {'form': form})