from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render

from app.models import *
from ela1 import predict_fn


def login(request):
    return render(request,'login.html')

def login_code(request):
    un=request.POST['textfield']
    ps=request.POST['textfield2']
    try:
        ob=login_table.objects.get(username=un, password=ps)
        if(ob.type=='admin'):
            return HttpResponse('''<script>alert('welcome');window.location='/admin_home'</script>''')
        if(ob.type=='user'):
            request.session['lid']=ob.id
            return HttpResponse('''<script>alert('welcome');window.location='/user_home'</script>''')
    except:
        return HttpResponse('''<script>alert('Incorrect username or password');window.location='/'</script>''')


def reg_code(request):
    nm=request.POST['textfield']
    em=request.POST['textfield2']
    ph=request.POST['textfield3']
    us=request.POST['textfield4']
    ps=request.POST['textfield5']
    cps=request.POST['textfield6']
    if ps == cps:
        ob=login_table()
        ob.username=us
        ob.password=ps
        ob.type="user"
        ob.save()

        oj=user_table()
        oj.LOGIN=ob
        oj.name=nm
        oj.email=em
        oj.phone=ph
        oj.save()
        return HttpResponse('''<script>alert('Registration complete');window.location='/'</script>''')
    else:
        return HttpResponse('''<script>alert('Password must be same')</script>''')


def user_complaint_code(request):
    cm=request.POST['textarea']

    ob=complaint_table()
    ob.complaint=cm
    ob.reply="pending"
    ob.date=datetime.today()
    ob.USER=user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert('Complaint Registered ');window.location='/user_all_complaint'</script>''')

def feedback_code(request):
    fb=request.POST['textarea']

    ob=feedback_table()
    ob.feedback=fb
    ob.date=datetime.today()
    ob.USER=user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert('Feedback uploaded');window.location='/user_home'</script>''')

def reply_code(request):
    rp=request.POST['textarea']

    ob=complaint_table.objects.get(id=request.session['cid'])
    ob.reply=rp
    ob.save()
    return HttpResponse('''<script>alert('Reply uploaded');window.location='/view_complaint'</script>''')

def delete_complaint(request,id):
    ob=complaint_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted');window.location='/user_all_complaint'</script>''')



def get_image(request):
    img=request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(img.name,img)
    res,ela=predict_fn(r'C:\Users\abhis\PycharmProjects\FakeImageDetection\media/'+fn)
    print(res,ela)
    ob=prediction_table()
    ob.image=fn
    ob.result=res
    ob.date=datetime.today()
    ob.USER=user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.errorlevel=ela
    ob.save()
    if res == "Fake":
        return  HttpResponse('''<script>alert("Highly Altered");window.location='/user_home'</script>''')
    else:
        return  HttpResponse('''<script>alert("Real Image");window.location='/user_home'</script>''')






def view_complaint(request):
    ob = complaint_table.objects.all().order_by('-id')
    return render(request,'admin/admin_complaint.html',{'val3':ob})

def view_feedback(request):
    ob = feedback_table.objects.all().order_by('-id')
    return render(request,'admin/admin_feedback.html',{'val4':ob})

def admin_home(request):
    return render(request,'admin/index.html')

def reply(request,id):
    request.session['cid']=id
    return render(request,'admin/admin_reply.html')

def view_user(request):
    ob=user_table.objects.all().order_by('-id')
    return render(request,'admin/admin_user.html',{'val':ob})

def user_all_complaint(request):
    ob=complaint_table.objects.filter(USER__LOGIN__id=request.session['lid'])
    return render(request,'user/all_complaint.html',{'val2':ob})

def user_complaint(request):
    return render(request,'user/complaint.html')

def feedback(request):
    return render(request,'user/feedback.html')

def view_history(request):
    ob=prediction_table.objects.filter(USER__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request,'user/history.html',{'val4':ob})

def user_home(request):
    return render(request,'user/index.html')

def view_prediction(request):
    return render(request,'user/prediction.html')

def signup(request):
    return render(request,'user/Signup.html')

def login(request):
    return render(request,'login.html')