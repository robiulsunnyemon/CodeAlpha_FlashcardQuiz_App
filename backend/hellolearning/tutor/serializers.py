from rest_framework import serializers
from .models import Question,Choice,QuestionAnswer,Categoryquestion,CategoryBlog,UserDetails,Blog



class CategoryquestionSerializer(serializers.ModelSerializer):
    class Meta:
        model=Categoryquestion
        fields = '__all__'




class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model=Choice
        fields = '__all__'



class QuestionSerializer(serializers.ModelSerializer):
    choices=ChoiceSerializer(many=True,read_only=True)

    class Meta:
        model= Question
        fields = '__all__'



class QuestionAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model= QuestionAnswer
        fields = '__all__'



## community

class CategoryBlogSerializer(serializers.ModelSerializer):
    class Meta:
        model= CategoryBlog
        fields = '__all__'


class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model= UserDetails
        fields = '__all__'


class BlogSerializer(serializers.ModelSerializer):
    user_details=UserDetailsSerializer(read_only=True)
    class Meta:
        model= Blog
        fields = '__all__'