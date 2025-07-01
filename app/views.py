from django.shortcuts import render
import requests
from django.http import JsonResponse

# Create your views here.
def send_number_to_fastapi(request):
    data={
        'num1': 10,
        'num2': 20
    }
    response = requests.post('http://52.192.213.17/api/add', json=data)
    result = response.json()
    return render(request, 'app/index.html', {'result': result})
        
