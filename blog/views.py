from django.shortcuts import render

from django.views.generic.base import View


class BlogAPIView(View):

    def get(self, request, *args, **kwargs):
        return render(request, 'blog/index.html', context={})
