import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from api.model.inference import Model

model = Model.from_path('api/model/garden/model.tflite')
# model = Model.from_path('api/model/garden/model.h5')


@csrf_exempt
def predict(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            user_data = data.get('data')

            if user_data is None:
                return JsonResponse({'error': 'No data provided'}, status=400)
            
            prediction = model.predict_from_data(user_data)

            return JsonResponse({'message': 'Data received', 'prediction': prediction}, status=200)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON format'}, status=400)
    else:
        return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)
    
@csrf_exempt
def predict_image(request):
    # Ambil gambar dari request
    image = request.FILES['image']
    # Preprocessing dan prediksi
    prediction = model.predict_from_image(image)  # Sesuaikan dengan fungsi prediksi di ipynb
    print("Prediction value:", prediction[0][0])  

    # Konversi hasil prediksi
    label = 'Ripe' if float(prediction[0][0]) > 0.5 else 'Unripe'
    print("Assigned label:", label)  # Debugging

    # Kirim respons JSON dengan label string
    return JsonResponse({"message": "Image received", "prediction": [label]})


# def predict_image(request): 
#     if request.method == 'POST':
#         try:
#             image = request.FILES.get('image')

#             if image is None:
#                 return JsonResponse({'error': 'No image provided'}, status=400)
            
#             prediction = model.predict_from_image(image)

#             return JsonResponse({'message': 'Image received', 'prediction': prediction}, status=200)
#         except json.JSONDecodeError:
#             return JsonResponse({'error': 'Invalid JSON format'}, status=400)
#     else:
#         return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)
