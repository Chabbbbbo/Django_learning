from django.http import HttpResponse



def index(request):
    return HttpResponse("Hello, Chabbo. You're at the polls index.")