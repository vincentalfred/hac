import django_tables2 as tables
from .models import Usage, DailyUsage

class UsageTable(tables.Table):
    class Meta:
        model = Usage
        template_name = 'django_tables2/bootstrap-responsive.html'
