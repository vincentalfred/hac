from django import forms
from tempus_dominus.widgets import DatePicker, TimePicker, DateTimePicker
from django.utils import timezone

class MyForm(forms.Form):
    
    start_date_field = forms.DateTimeField(
        required=True,
        widget=DatePicker(
            options={
                'defaultDate' : (timezone.now() + timezone.timedelta(days=-7)).strftime("%Y-%m-%d"),
                'minDate': '2019-01-01',
                'maxDate': timezone.now().strftime("%Y-%m-%d"),
            },
        ),
    )

    end_date_field = forms.DateTimeField(
        required=True,
        widget=DatePicker(
            options={
                'minDate': '2019-01-01',
                'maxDate': timezone.now().strftime("%Y-%m-%d"),
            },
        ),
    )
    
  
