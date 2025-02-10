

"""
URL configuration for hellolearning project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path,include
from tutor.views import QuestionViewSet,ChoiceViewSet,QuestionAnswerViewSet,CategoryquestionViewSet,student_leaderboard,CategoryBlogViewSet,UserDetailsViewSet,BlogViewSet,blogs_by_category,questions_by_category,choice_by_question_id,RegisterView,LoginView

from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('questions', QuestionViewSet)
router.register('choices', ChoiceViewSet)
router.register('question_answers', QuestionAnswerViewSet)
router.register('question_categories', CategoryquestionViewSet)
router.register('blog_catagories',CategoryBlogViewSet)
router.register('user_details',UserDetailsViewSet)
router.register('blogs',BlogViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/student_leaderboard/', student_leaderboard, name='student_leaderboard'),
    path('api/questions/category/<int:category_id>/', questions_by_category, name='questions_by_category'),
    path('api/blog/category/<int:category_id>/', blogs_by_category, name='blogs_by_category'),
    path('api/choices/question/<int:question_id>/', choice_by_question_id, name='choice_by_question_id'),
    path('api/auth/signup/', RegisterView.as_view(), name='signup'),
    path('api/auth/login/', LoginView.as_view(), name='login'),

]



# ইমেজ সেভ করার জন্য
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)